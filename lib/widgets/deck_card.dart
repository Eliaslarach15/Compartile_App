import 'package:flutter/material.dart';
import '../models/deck_model.dart';

class DeckCard extends StatelessWidget {
  final DeckModel deck;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final bool showEditButton;

  const DeckCard({
    Key? key,
    required this.deck,
    this.onTap,
    this.onEdit,
    this.showEditButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(deck.title),
        onTap: onTap,
        trailing: showEditButton
            ? IconButton(
                icon: const Icon(Icons.edit),
                onPressed: onEdit,
              )
            : null,
      ),
    );
  }
}
