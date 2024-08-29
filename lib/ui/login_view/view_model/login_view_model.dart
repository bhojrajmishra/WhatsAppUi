import 'package:flutter/material.dart';
import 'package:flutter_first_ui/constants/constants_validation.dart';
import 'package:flutter_first_ui/base/base_view_model.dart';
import 'package:flutter_first_ui/ui/login_view/models/login_model.dart';
import 'package:flutter_first_ui/ui/login_view/models/login_response.dart';
import 'package:flutter_first_ui/ui/home_view/home_view.dart';
import 'package:flutter_first_ui/ui/login_view/repository/login_repository.dart';
import 'package:flutter_first_ui/ui/login_view/repository/login_repository_implementation.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginRepository _loginRepository = LoginRepositoryImpl();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    return null;
  }

  Future<void> requestLoginApi(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    if (!formKey.currentState!.validate()) {
      _showSnackBar(context, ConstantsValidation.fillAllFieldsMessage);
      return;
    }

    updateLoading(loading: true);

    LoginRequest loginModel = LoginRequest(email: email, password: password);
    LoginResponse? loginResult =
        await _loginRepository.requestLoginApi(loginModel);

    updateLoading(loading: false);

    if (!context.mounted) return;

    if (loginResult != null) {
      _handleSuccessfulLogin(loginResult);
      _navigateToHome(context);
    } else {
      _showSnackBar(context, ConstantsValidation.loginFailedMessage);
    }
  }

  void _handleSuccessfulLogin(LoginResponse loginResponse) {
    // Handle the successful login
    debugPrint('Logged in as: ${loginResponse.fullName}');
    debugPrint('Token: ${loginResponse.token}');
    // Add more handling as needed
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
