import 'package:isar/isar.dart';
import 'package:quoter_final/domain/models/quote_model.dart';

part 'isar_liked_quote.g.dart';

@collection
class IsarLikedQuoted {
  Id id = Isar.autoIncrement;
  late String author;
  late String quote;
  late bool isLiked;

  IsarLikedQuoted(
      {required this.id,
      required this.author,
      required this.quote,
      required this.isLiked});

  QuoteModel toDomain() {
    return QuoteModel(
      id: id,
      author: author,
      quote: quote,
      isLiked: isLiked,
    );
  }

  static IsarLikedQuoted fromDomain(QuoteModel quoteModel) {
    return IsarLikedQuoted(
      id: quoteModel.id,
      author: quoteModel.author,
      quote: quoteModel.quote,
      isLiked: quoteModel.isLiked,
    );
  }
}
