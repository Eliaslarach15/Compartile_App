import 'package:flutter/material.dart';
import 'friends_screen.dart';
import 'my_decks_screen.dart';
import 'add_friend_screen.dart';

class SocialScreen extends StatelessWidget {
  final int userId;
  const SocialScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Social')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FriendsScreen(userId: userId),
                  ),
                );
              },
              child: const Text('Ver Amigos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyDecksScreen(userId: userId),
                  ),
                );
              },
              child: const Text('Mis Barajas'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddFriendScreen(userId: userId),
                  ),
                );
              },
              child: const Text('Añadir Amigo'),
            ),
          ],
        ),
      ),
    );
  }
}
