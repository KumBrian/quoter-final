import 'package:flutter/cupertino.dart';
import 'package:quoter_final/domain/models/quote_model.dart';

abstract class QuoteRepo {
  Future<void> addQuote(QuoteModel quoteModel);
  Future<void> deleteQuote(QuoteModel quoteModel);
  Future<List<QuoteModel>> getQuotes();
  Future<void> copyQuote(QuoteModel quoteModel, BuildContext context);
}
