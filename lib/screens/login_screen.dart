import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_first_ui/components/custom_text_field.dart';
import 'package:flutter_first_ui/screens/home_screen.dart';
import 'package:flutter_first_ui/screens/registration_screen.dart';
import 'package:flutter_first_ui/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userForm = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> loginUrl() async {
    final payload = {
      'username': email.text,
      'password': password.text,
    };
    debugPrint("Payload: $payload");

    try {
      // Make the POST request
      Response response = await Dio().post(
        ApiPath.loginUrl,
        data: payload,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        // Show error if login failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: ${response.statusCode}')),
        );
      }
    } catch (e) {
      debugPrint('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
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
              const SizedBox(
                height: 100,
                width: 100,
              ),
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
              ElevatedButton(
                onPressed: () {
                  if (userForm.currentState?.validate() ?? false) {
                    loginUrl();
                  }
                },
                child: const Text("Login"),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const RegistrationScreen();
                      }));
                    },
                    child: const Text(
                      "Register here!",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
