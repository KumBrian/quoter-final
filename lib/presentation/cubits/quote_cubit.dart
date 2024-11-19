import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quoter_final/domain/models/quote_model.dart';
import 'package:quoter_final/domain/repository/quote_repo.dart';

class QuoteCubit extends Cubit<List<QuoteModel>> {
  final QuoteRepo quoteRepo;
  QuoteCubit(this.quoteRepo) : super([]) {
    loadQuotes();
  }

  //L O A D  Q U O T E S
  Future<void> loadQuotes() async {
    final quotes = await quoteRepo.getQuotes();
    emit(quotes);
  }

  //T O G G L E  L I K E
  Future<void> toggleLike(QuoteModel quote) async {
    if (quote.isLiked) {
      quoteRepo.unlikeQuote(quote);
      quote.toggleLiked();
    } else {
      quoteRepo.likeQuote(quote);
      quote.toggleLiked();
    }
  }

  //C O P Y   Q U O T E
  Future<void> copyQuote(QuoteModel quote, BuildContext context) async {
    quoteRepo.copyQuote(quote, context);
  }
}
