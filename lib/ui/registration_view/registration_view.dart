import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/registration_view/widgets/registration_service.dart';
import 'package:flutter_first_ui/ui/login_view/login_view.dart';
import 'package:flutter_first_ui/components/custom_text_field.dart';
import 'package:flutter_first_ui/ui/home_view/widgets/custom_button.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final userForm = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  Future<void> _handleRegistration() async {
    if (userForm.currentState?.validate() ?? false) {
      bool success = await RegistrationService.register(
        emailController.text,
        nameController.text,
        passwordController.text,
        context,
      );

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginView()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration failed')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Page"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginView()),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: userForm,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 100, width: 100),
                      CustomTextFormField(
                        controller: nameController,
                        labelText: "Full Name",
                        obscureText: false,
                      ),
                      const SizedBox(height: 23),
                      CustomTextFormField(
                        controller: emailController,
                        labelText: "Email",
                        obscureText: false,
                      ),
                      const SizedBox(height: 23),
                      CustomTextFormField(
                        controller: passwordController,
                        labelText: "Password",
                        obscureText: true,
                      ),
                      const SizedBox(height: 23),
                      CustomButton(
                        text: "Register",
                        onPressed: _handleRegistration,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
