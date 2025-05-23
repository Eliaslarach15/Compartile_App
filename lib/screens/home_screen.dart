import 'package:flutter/material.dart';
import '../screens/game_screen.dart';
import '../widgets/mode_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Compartile",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            ModeButton(
              color: Colors.blue,
              title: 'Normal',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(mode: 'Normal'),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            ModeButton(
              color: Colors.grey,
              title: 'Profundo',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(mode: 'Profundo'),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            ModeButton(
              color: Colors.red,
              title: 'Hot',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(mode: 'Hot'),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(mode: 'Aleatorio'),
                  ),
                );
              },
              child: Text(
                "Barajar todas las cartas",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
