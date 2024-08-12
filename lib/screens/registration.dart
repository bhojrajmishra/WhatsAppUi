import 'package:flutter/material.dart';
import 'package:flutter_first_ui/screens/login.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var userForm = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Page"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return LoginScreen();
            })); // Navigate back to previous screen
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
                      SizedBox(
                        height: 100,
                        width: 100,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Full Name is Required";
                          }
                        },
                        decoration: InputDecoration(labelText: "Full Name"),
                      ),
                      SizedBox(height: 23),
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
                            return "Password is Required";
                          }
                        },
                        decoration: InputDecoration(labelText: "Password"),
                      ),
                      SizedBox(height: 23),
                      ElevatedButton(
                        onPressed: () {
                          print("Email: ${email.text}");
                          print("Password: ${password.text}");
                          print("Name: ${name.text}");
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginScreen();
                          }));
                        },
                        child: Text("Register"),
                      ),
                    ],
                  ),
                )),
          ))
        ],
      ),
    );
  }
}
