import 'package:hive/hive.dart';
import 'package:quoter_final/domain/models/quote_model.dart';

part 'hive_quote.g.dart';

@HiveType(typeId: 0)
class QuoteHive extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String author;

  @HiveField(2)
  String quote;

  @HiveField(3)
  bool isLiked;

  QuoteHive(
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

  static QuoteHive fromDomain(QuoteModel quoteModel) {
    return QuoteHive(
      id: quoteModel.id,
      author: quoteModel.author,
      quote: quoteModel.quote,
      isLiked: quoteModel.isLiked,
    );
  }
}
