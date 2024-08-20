import 'package:flutter/material.dart';
import 'package:flutter_first_ui/components/login_servide.dart';
import 'package:flutter_first_ui/ui/home_view/home_view.dart';
import 'package:flutter_first_ui/components/custom_text_field.dart';
import 'package:flutter_first_ui/ui/home_view/widgets/custom_button.dart';
import 'package:flutter_first_ui/ui/registration_view/widgets/registration_link.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final userForm = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> _handleLogin() async {
    if (userForm.currentState?.validate() ?? false) {
      bool success =
          await LoginService.login(email.text, password.text, context);
      if (success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: userForm,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100, width: 100),
              CustomTextFormField(
                controller: email,
                labelText: "Email",
                obscureText: false,
              ),
              const SizedBox(height: 23),
              CustomTextFormField(
                controller: password,
                labelText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 23),
              CustomButton(
                text: "Login",
                onPressed: _handleLogin,
              ),
              const SizedBox(height: 20),
              const RegistrationLink(),
            ],
          ),
        ),
      ),
    );
  }
}
