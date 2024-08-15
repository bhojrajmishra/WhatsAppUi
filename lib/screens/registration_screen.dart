import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_first_ui/components/custom_text_field.dart';
import 'package:flutter_first_ui/screens/login_screen.dart';
import 'package:flutter_first_ui/utils/constants.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final userForm = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  Future<void> registrationUrl() async {
    final payload = {
      'email': emailController.text,
      'full_name': nameController.text,
      'password': passwordController.text,
    };
    print("Payload: $payload");

    try {
      final response = await Dio().post(
        ApiPath.registerUrl,
        data: payload,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Registration failed: ${response.statusCode}')),
        );
      }
    } catch (e) {
      // Handle exceptions
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
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
              MaterialPageRoute(builder: (context) => const LoginScreen()),
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
                      const SizedBox(
                        height: 100,
                        width: 100,
                      ),
                      CustomTextFormField(
                          controller: nameController,
                          labelText: "full_name",
                          obscureText: false),
                      const SizedBox(height: 23),
                      CustomTextFormField(
                          controller: emailController,
                          labelText: "email",
                          obscureText: false),
                      const SizedBox(height: 23),
                      CustomTextFormField(
                          controller: passwordController,
                          labelText: "password",
                          obscureText: true),
                      const SizedBox(height: 23),
                      ElevatedButton(
                        onPressed: () {
                          if (userForm.currentState?.validate() ?? false) {
                            registrationUrl();
                          }
                        },
                        child: const Text("Register"),
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
