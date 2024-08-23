import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/home_view/view_model/loading_view_model.dart';
import 'package:flutter_first_ui/ui/login_view/models/login_model.dart';

import 'package:flutter_first_ui/ui/home_view/home_view.dart';
import 'package:flutter_first_ui/ui/login_view/repository/login_repository.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginRepository _loginRepository = LoginRepository();

  Future<void> handleLogin(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      _showSnackBar(context, 'Please fill in all fields');
      return;
    }

    final loadingViewModel =
        Provider.of<LoadingViewModel>(context, listen: false);
    loadingViewModel.updateLoading(loading: true);

    LoginModel? loginResult = await _loginRepository.login(email, password);

    loadingViewModel.updateLoading(loading: false);

    if (!context.mounted) return;

    if (loginResult != null) {
      _navigateToHome(context);
    } else {
      _showSnackBar(context, 'Login failed');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  void _navigateToHome(BuildContext context) {
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    }
  }
}
