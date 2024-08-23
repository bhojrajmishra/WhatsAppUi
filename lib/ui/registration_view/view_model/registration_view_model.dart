import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/home_view/view_model/loading_view_model.dart';
import 'package:flutter_first_ui/ui/login_view/login_view.dart';
import 'package:flutter_first_ui/ui/registration_view/repository%20/registor_repository.dart';
import 'package:provider/provider.dart';

class RegistrationViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final RegistrationRepository registrationRepository =
      RegistrationRepository();

  Future<void> handleRegistration(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;
    final name = nameController.text;
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      _showSnackBar(context, 'Please fill in all fields');
      return;
    }

    final loadingViewModel =
        Provider.of<LoadingViewModel>(context, listen: false);
    loadingViewModel.updateLoading(loading: true);

    bool success = await registrationRepository.register(email, name, password);

    loadingViewModel.updateLoading(loading: false);

    if (context.mounted) {
      if (success) {
        _navigateToHome(context);
      } else {
        _showSnackBar(context, 'Registration failed');
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

  void _navigateToHome(BuildContext context) {
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    }
  }
}
