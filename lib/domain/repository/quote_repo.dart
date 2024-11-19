import 'package:flutter/cupertino.dart';
import 'package:quoter_final/domain/models/quote_model.dart';

abstract class QuoteRepo {
  Future<void> likeQuote(QuoteModel quoteModel);
  Future<void> unlikeQuote(QuoteModel quoteModel);
  Future<List<QuoteModel>> getQuotes();
  Future<List<QuoteModel>> getLikedQuotes();
  Future<void> copyQuote(QuoteModel quoteModel, BuildContext context);
}
