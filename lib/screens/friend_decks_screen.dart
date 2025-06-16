import 'package:flutter/material.dart';
import '../services/data_service.dart';
import '../models/deck_model.dart';

class FriendDeckScreen extends StatefulWidget {
  final int friendId;
  final String friendName;

  const FriendDeckScreen(
      {Key? key, required this.friendId, required this.friendName})
      : super(key: key);

  @override
  State<FriendDeckScreen> createState() => _FriendDeckScreenState();
}

class _FriendDeckScreenState extends State<FriendDeckScreen> {
  List<DeckModel> decks = [];

  @override
  void initState() {
    super.initState();
    _loadFriendDecks();
  }

  Future<void> _loadFriendDecks() async {
    final result = await DataService.getMyDecks(widget.friendId);
    setState(() {
      decks = result;
    });
  }

  void _playDeck(DeckModel deck) {
    // Aquí podés navegar a la pantalla de juego usando la baraja seleccionada
    // Navigator.push(...);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barajas de ${widget.friendName}'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: decks.length,
        itemBuilder: (context, index) {
          final deck = decks[index];
          return ListTile(
            title: Text(deck.title),
            trailing: ElevatedButton(
              onPressed: () => _playDeck(deck),
              child: const Text('Jugar'),
            ),
          );
        },
      ),
    );
  }
}
