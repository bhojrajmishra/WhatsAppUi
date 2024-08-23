import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/home_view/view_model/loading_view_model.dart';
import 'package:flutter_first_ui/ui/registration_view/services/registration_service.dart';
import 'package:flutter_first_ui/ui/login_view/login_view.dart';
import 'package:provider/provider.dart';

class RegistrationViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> handleRegistration(BuildContext context) async {
    if (emailController.text.isEmpty ||
        nameController.text.isEmpty ||
        passwordController.text.isEmpty) {
      _showSnackBar(context, 'Please fill in all fields');
      return;
    }

    final loadingViewModel =
        Provider.of<LoadingViewModel>(context, listen: false);

    bool success = await RegistrationService.register(
      emailController.text,
      nameController.text,
      passwordController.text,
    );

    loadingViewModel.updateLoading(loading: false);

    if (context.mounted) {
      if (success) {
        _navigateToLogin(context);
      } else {
        _showSnackBar(context, 'Registration failed');
      }
    }
  }
}

void _showSnackBar(BuildContext context, String message) {
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

void _navigateToLogin(BuildContext context) {
  if (context.mounted) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }
}
