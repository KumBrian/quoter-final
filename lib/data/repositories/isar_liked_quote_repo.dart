import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';
import 'package:quoter_final/data/models/isar_liked_quote.dart';
import 'package:quoter_final/domain/models/quote_model.dart';
import 'package:quoter_final/domain/repository/quote_repo.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class IsarLikedQuoteRepo implements QuoteRepo {
  Isar db;
  IsarLikedQuoteRepo(this.db);

  @override
  Future<void> likeQuote(QuoteModel quoteModel) async {
    final quoteIsar = IsarLikedQuoted.fromDomain(quoteModel);
    return db.writeTxn(() => db.isarLikedQuoteds.put(quoteIsar));
  }

  @override
  Future<void> unlikeQuote(QuoteModel quoteModel) async {
    await db.writeTxn(() => db.isarLikedQuoteds.delete(quoteModel.id));
  }

  @override
  Future<void> copyQuote(QuoteModel quoteModel, BuildContext context) async {
    await Clipboard.setData(ClipboardData(
      text: "`${quoteModel.quote}`\n\nBy ${quoteModel.author}",
    ));

    // Check if the widget is still mounted
    if (!context.mounted) return;

    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.9),
        textStyle: GoogleFonts.getFont(
          'Montserrat',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        message: 'Copied',
      ),
    );
  }

  @override
  Future<List<QuoteModel>> getQuotes() async {
    String apiKey = dotenv.env['API_KEY'] ?? '';
    String baseUrl = dotenv.env['BASE_URL'] ?? '';

    List<QuoteModel> result = [];

    for (int i = 0; i < 5; i++) {
      final http.Response response = await http.get(
          Uri.parse('$baseUrl?category=happiness'),
          headers: {'X-Api-Key': apiKey});
      if (response.statusCode == 200) {
        List jsonData = jsonDecode(response.body);
        result.add(QuoteModel.fromJson(jsonData));
      } else {
        print('Returning Null');
        continue;
      }
    }
    return result;
  }

  @override
  Future<List<QuoteModel>> getLikedQuotes() async {
    final likedQuotes = await db.isarLikedQuoteds.where().findAll();
    return likedQuotes
        .map((isarLikedQuote) => isarLikedQuote.toDomain())
        .toList();
  }
}
