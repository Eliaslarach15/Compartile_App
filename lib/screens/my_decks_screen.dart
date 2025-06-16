import 'package:flutter/material.dart';
import '../models/deck_model.dart';
import '../services/data_service.dart';
import '../widgets/deck_card.dart';

class MyDecksScreen extends StatefulWidget {
  final int userId;

  const MyDecksScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _MyDecksScreenState createState() => _MyDecksScreenState();
}

class _MyDecksScreenState extends State<MyDecksScreen> {
  final DataService _dataService = DataService();
  late Future<List<DeckModel>> _decksFuture;

  @override
  void initState() {
    super.initState();
    _decksFuture = DataService.fetchUserDecks(widget.userId);
  }

  void _refreshDecks() {
    setState(() {
      _decksFuture = DataService.fetchUserDecks(widget.userId);
    });
  }

  void _createDeck() async {
    // Implementa la lógica para crear una nueva baraja
    // Por ejemplo, mostrar un diálogo para ingresar el título
    final TextEditingController _controller = TextEditingController();
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Nueva Baraja'),
        content: TextField(
          controller: _controller,
          decoration: InputDecoration(hintText: 'Título de la baraja'),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await DataService.createDeck(
                  widget.userId.toString(), _controller.text);

              Navigator.of(context).pop();
              _refreshDecks();
            },
            child: Text('Crear'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Barajas'),
      ),
      body: FutureBuilder<List<DeckModel>>(
        future: _decksFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error al cargar las barajas'));
          }
          final decks = snapshot.data!;
          return ListView.builder(
            itemCount: decks.length,
            itemBuilder: (context, index) {
              final deck = decks[index];
              return DeckCard(
                deck: deck,
                onTap: () {
                  // Implementa la lógica para jugar o ver la baraja
                },
                onEdit: () {
                  // Implementa la lógica para editar la baraja
                },
                showEditButton: true,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createDeck,
        child: Icon(Icons.add),
      ),
    );
  }
}
