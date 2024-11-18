class QuoteModel {
  int id;
  String author;
  String quote;
  bool isLiked;

  QuoteModel(
      {required this.id,
      required this.author,
      required this.quote,
      required this.isLiked});

  QuoteModel toggleLiked() {
    return QuoteModel(
      id: id,
      author: author,
      quote: quote,
      isLiked: !isLiked,
    );
  }
}
