import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/home_view/view_model/loading_view_model.dart';
import 'package:flutter_first_ui/ui/login_view/services/login_service.dart';
import 'package:flutter_first_ui/ui/home_view/home_view.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

    bool success = await LoginService.login(email, password);

    loadingViewModel.updateLoading(loading: false);

    if (!context.mounted) return;

    if (success) {
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
