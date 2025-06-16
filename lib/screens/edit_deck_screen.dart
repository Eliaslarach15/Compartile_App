import 'package:flutter/material.dart';

class EditDeckScreen extends StatefulWidget {
  final String deckName;
  final List<String> cards;

  EditDeckScreen({required this.deckName, required this.cards});

  @override
  _EditDeckScreenState createState() => _EditDeckScreenState();
}

class _EditDeckScreenState extends State<EditDeckScreen> {
  late List<String> _cards;

  @override
  void initState() {
    super.initState();
    _cards = List.from(widget.cards);
  }

  void _addCard() {
    setState(() {
      _cards.add('');
    });
  }

  void _saveCard(int index, String newText) {
    setState(() {
      _cards[index] = newText;
    });
  }

  void _deleteCard(int index) {
    setState(() {
      _cards.removeAt(index);
    });
  }

  void _saveDeck() {
    Navigator.pop(context, _cards);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar baraja: ${widget.deckName}'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveDeck,
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _cards.length + 1,
        itemBuilder: (context, index) {
          if (index == _cards.length) {
            return Center(
              child: ElevatedButton.icon(
                onPressed: _addCard,
                icon: Icon(Icons.add),
                label: Text("Añadir carta"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            );
          }

          return Card(
            child: ListTile(
              title: TextFormField(
                initialValue: _cards[index],
                onChanged: (text) => _saveCard(index, text),
                decoration: InputDecoration(
                  hintText: 'Escribe la carta...',
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                maxLines: null,
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _deleteCard(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
