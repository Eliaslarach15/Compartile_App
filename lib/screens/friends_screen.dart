import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/data_service.dart';
import 'friend_decks_screen.dart';

class FriendsScreen extends StatefulWidget {
  final int userId;
  const FriendsScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  List<UserModel> friends = [];

  @override
  void initState() {
    super.initState();
    loadFriends();
  }

  Future<void> loadFriends() async {
    friends = await DataService.getFriends(widget.userId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Amigos')),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          final friend = friends[index];
          return ListTile(
            title: Text(friend.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FriendDeckScreen(
                    friendId: friend.id,
                    friendName: '',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
