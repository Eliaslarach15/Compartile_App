//reset_password_screen.dart
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final newPasswordController = TextEditingController();
  final authService = AuthService();

  void resetPassword() async {
    await authService.updatePassword(newPasswordController.text);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Cambiar Contraseña", style: TextStyle(fontSize: 28)),
          TextField(
            controller: newPasswordController,
            decoration: const InputDecoration(labelText: "Nueva Contraseña"),
            obscureText: true,
          ),
          ElevatedButton(
              onPressed: resetPassword, child: const Text("Guardar")),
        ]),
      ),
    );
  }
}
