import 'dart:math';
import 'package:flutter/material.dart';
import '../data/questions.dart';
import 'end_screen.dart';

class GameScreen extends StatefulWidget {
  final String mode;

  const GameScreen({required this.mode});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> selectedQuestions = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  void loadQuestions() {
    List<String> source;
    if (widget.mode == 'Normal') {
      source = normalQuestions;
    } else if (widget.mode == 'Profundo') {
      source = deepQuestions;
    } else if (widget.mode == 'Hot') {
      source = hotQuestions;
    } else {
      // Aleatorio
      source = [...normalQuestions, ...deepQuestions, ...hotQuestions];
    }

    source.shuffle(Random());
    selectedQuestions = source.take(10).toList();
  }

  Color getBackgroundColor() {
    switch (widget.mode) {
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

  Color getTextColor() {
    switch (widget.mode) {
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
      backgroundColor: getBackgroundColor(),
      appBar: AppBar(
        backgroundColor: getBackgroundColor(),
        elevation: 0,
        title: Text("Compartile", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                selectedQuestions[currentIndex],
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center,
              ),
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
                setState(() {
                  if (currentIndex < selectedQuestions.length - 1) {
                    currentIndex++;
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EndScreen(mode: widget.mode),
                      ),
                    );
                  }
                });
              },
              child: Text("Siguiente", style: TextStyle(color: getTextColor())),
            ),
          ],
        ),
      ),
    );
  }
}
