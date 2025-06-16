import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'game_screen.dart';

class EndScreen extends StatelessWidget {
  final String mode;

  const EndScreen({required this.mode});

  Color getColor() {
    switch (mode) {
      case 'Normal':
        return Colors.blue;
      case 'Profundo':
        return Colors.grey;
      case 'Hot':
        return Colors.red;
      default:
        return Colors.deepPurple;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColor(),
      appBar: AppBar(
        backgroundColor: getColor(),
        elevation: 0,
        title: Text("Compartile", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "La partida terminó",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(mode: mode),
                  ),
                );
              },
              child: Text(
                "Volver a jugar",
                style: TextStyle(color: getColor()),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(
                      userId: 0,
                      username: '',
                    ), // Reemplaza 0 con el valor adecuado de userId
                  ),
                );
              },
              child: Text(
                "Volver al menú",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
