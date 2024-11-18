import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:quoter_final/data/models/hive_quote.dart';
import 'package:quoter_final/domain/models/quote_model.dart';
import 'package:quoter_final/domain/repository/quote_repo.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HiveQuoteRepo implements QuoteRepo {
  final Box<QuoteHive> _box;
  HiveQuoteRepo(this._box);

  @override
  Future<void> addQuote(QuoteModel quoteModel) async {
    final quoteHive = QuoteHive.fromDomain(quoteModel);
    await _box.add(quoteHive);
  }

  @override
  Future<void> deleteQuote(QuoteModel quoteModel) async {
    final quoteHive =
        _box.values.firstWhere((element) => element.id == quoteModel.id);
    await quoteHive.delete(); // Delete from the Hive box
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
    final quotes = _box.values.toList();
    return quotes.map((quoteHive) => quoteHive.toDomain()).toList();
  }
}
