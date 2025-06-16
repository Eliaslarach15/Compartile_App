import 'card_model.dart';

class DeckModel {
  final int id;
  final String title;
  final int userId;
  final List<CardModel> cards;

  DeckModel({
    required this.id,
    required this.title,
    required this.userId,
    required this.cards,
  });

  factory DeckModel.fromJson(Map<String, dynamic> json) {
    return DeckModel(
      id: json['id'],
      title: json['title'],
      userId: json['userId'],
      cards: (json['cards'] as List<dynamic>)
          .map((e) => CardModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'userId': userId,
      'cards': cards.map((e) => e.toJson()).toList(),
    };
  }
}
