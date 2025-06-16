//home_screen.dart
import 'package:flutter/material.dart';
import 'package:compartile/screens/social_screen.dart';
import 'package:compartile/screens/game_screen.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({super.key, required this.username, required int userId});
  void navigateToGame(BuildContext context, String mode) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(mode: mode),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 8, 161),
      body: Stack(
        children: [
          // Botón de amigos en la parte superior derecha
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.group, color: Colors.white, size: 32),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SocialScreen(userId: int.parse(username)),
                  ),
                );
              },
            ),
          ),
          // Contenido centrado
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Compartile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 90), // Baja los cuadraditos un poco más
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _ModeCard(
                        title: 'Normal',
                        color: const Color.fromARGB(255, 0, 94, 255),
                        onTap: () => navigateToGame(context, 'normal'),
                      ),
                      _ModeCard(
                        title: 'Profundo',
                        color: const Color.fromARGB(255, 77, 77, 77),
                        onTap: () => navigateToGame(context, 'deep'),
                      ),
                      _ModeCard(
                        title: 'Hot',
                        color: Colors.red,
                        onTap: () => navigateToGame(context, 'hot'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 90), // Espacio entre modos y botón
                Center(
                  child: GestureDetector(
                    onTap: () => navigateToGame(context, 'all'),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Colors.purple,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child:
                            Icon(Icons.shuffle, color: Colors.white, size: 40),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ModeCard extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _ModeCard({
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
