import 'package:flutter/material.dart';
import 'package:flutter_first_ui/constants/constants_validation.dart';
import 'package:flutter_first_ui/base/loading_view_model.dart';
import 'package:flutter_first_ui/ui/login_view/login_view.dart';
import 'package:flutter_first_ui/ui/registration_view/models/registration_model.dart';
import 'package:flutter_first_ui/ui/registration_view/repository%20/registor_repository.dart';
import 'package:flutter_first_ui/ui/registration_view/repository%20/repository%20Implementation/registor_repository_implimentation.dart';
import 'package:provider/provider.dart';

class RegistrationViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final RegistrationRepository registrationRepository =
      RegistrationRepositoryImpl();

  Future<void> handleRegistration(BuildContext context) async {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showSnackBar(context, FormValidation.fillAllFields);
      return;
    }

    final loadingViewModel =
        Provider.of<LoadingViewModel>(context, listen: false);
    loadingViewModel.updateLoading(loading: true);

    RegistrationModel model = RegistrationModel(
      name: name,
      email: email,
      password: password,
    );

    bool success = await registrationRepository.register(model);

    loadingViewModel.updateLoading(loading: false);

    if (context.mounted) {
      if (success) {
        _navigateToLogin(context);
      } else {
        _showSnackBar(context, FormValidation.registrationFailed);
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
        MaterialPageRoute(builder: (context) => LoginView()),
      );
    }
  }
}
