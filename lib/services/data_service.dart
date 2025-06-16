//DataService.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/deck_model.dart';
import '../models/user_model.dart';

class DataService {
  static const String baseUrl = 'http://192.168.1.10:5157';

  static Future<List<UserModel>> getFriends(int userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/friends/$userId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load friends');
    }
  }

  static Future<List<DeckModel>> getMyDecks(int userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/decks/user/$userId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((e) => DeckModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load decks');
    }
  }

  static Future<List<DeckModel>> fetchUserDecks(int userId) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/api/decks/user/$userId'));

      print('Respuesta: ${response.statusCode}');
      print('Body: ${response.body}');

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        return data.map((e) => DeckModel.fromJson(e)).toList();
      } else {
        throw Exception(
            'Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Excepción: $e');
      throw Exception('Falló la conexión o hubo un error');
    }
  }

  static Future<void> addFriend(int userId, int friendId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/friends'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userId': userId,
        'friendId': friendId,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add friend');
    }
  }

  static Future<void> createDeck(String title, String userId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/decks'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userId': userId,
        'title': title,
      }),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Error al crear la baraja: ${response.body}');
    }

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Error al crear la baraja: ${response.body}');
    }
  }

  Future<void> updateDeck(int deckId, String newTitle) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/decks/$deckId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': newTitle}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update deck');
    }
  }

  Future<void> deleteDeck(int deckId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/decks/$deckId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete deck');
    }
  }
}
