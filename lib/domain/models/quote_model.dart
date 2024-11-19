class QuoteModel {
  final int id;
  final String author;
  final String quote;
  final bool isLiked;

  QuoteModel(
      {required this.id,
      required this.author,
      required this.quote,
      this.isLiked = false});

  QuoteModel toggleLiked() {
    return QuoteModel(
      id: id,
      author: author,
      quote: quote,
      isLiked: !isLiked,
    );
  }

  factory QuoteModel.fromJson(List json) {
    return QuoteModel(
      id: DateTime.now().millisecondsSinceEpoch,
      quote: json[0]['quote'],
      author: json[0]['author'],
    );
  }
}
