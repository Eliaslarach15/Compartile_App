import 'package:compartile/screens/register_screen.dart';
import 'package:compartile/screens/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'services/auth_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Compartile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Entra directo a HomeScreen, sin verificar login
      home: HomeScreen(userId: 1, username: 'Invitado'),
      routes: {
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        '/reset': (_) => const ResetPasswordScreen(),
      },
    );
  }
}
