import 'package:flutter/material.dart';

class AddFriendScreen extends StatelessWidget {
  final int userId;

  const AddFriendScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _codeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir Amigo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Ingresa el código de tu amigo:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: _codeController,
              decoration: InputDecoration(hintText: 'Código de amigo'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implementa la lógica para añadir al amigo usando el código
              },
              child: Text('Añadir'),
            ),
            SizedBox(height: 32),
            Text(
              'O comparte tu enlace:',
              style: TextStyle(fontSize: 16),
            ),
            SelectableText(
              'http://tuapp.com/add_friend?code=ABC123',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
