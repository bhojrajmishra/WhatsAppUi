import 'package:flutter/material.dart';
import 'package:flutter_first_ui/screens/home.dart';
import 'package:flutter_first_ui/screens/registration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userForm = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
              SizedBox(
                height: 100,
                width: 100,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is Required";
                  }
                },
                decoration: InputDecoration(labelText: "Email"),
              ),
              SizedBox(height: 23),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "password is Required";
                  }
                },
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(labelText: "password"),
              ),
              SizedBox(height: 23),
              ElevatedButton(
                onPressed: () {
                  debugPrint("Email: ${email.text}");
                  debugPrint("Password: ${password.text}");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                },
                child: Text("Login"),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Don't have an account?"),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return RegistrationScreen();
                      }));
                    },
                    child: Text(
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
