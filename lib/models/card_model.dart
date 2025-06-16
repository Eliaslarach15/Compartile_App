class CardModel {
  final int id;
  final int deckId;
  final String content;

  CardModel({
    required this.id,
    required this.deckId,
    required this.content,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'],
      deckId: json['deckId'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'deckId': deckId,
      'content': content,
    };
  }
}
