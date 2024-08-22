// lib/ui/login_view/view_model/login_view_model.dart

import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/login_view/services/login_service.dart';
import 'package:flutter_first_ui/ui/home_view/home_view.dart';

class LoginViewModel extends ChangeNotifier {
  Future<void> handleLogin(
      BuildContext context, String email, String password) async {
    if (_validateForm(context, email, password)) {
      bool success = await LoginService.login(email, password);

      if (success) {
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
          );
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login failed')),
          );
        }
      }
    }
  }

  bool _validateForm(BuildContext context, String email, String password) {
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email is required')),
      );
      return false;
    }
    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password is required')),
      );
      return false;
    }
    return true;
  }
}
