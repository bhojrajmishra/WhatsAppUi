import 'package:flutter/material.dart';
import 'package:flutter_first_ui/components/custom_text_field.dart';
import 'package:flutter_first_ui/screens/home.dart';
import 'package:flutter_first_ui/screens/registration.dart';
import 'package:dio/dio.dart';

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
  Future<void> putData() async {
    //get data from api

    setState(() {
      // isloading = true;
    });
    try {
      Response response =
          await Dio().put("https://tbe.thuprai.com/v1/api/login/");
      debugPrint(response.data.toString());

      setState(() {
        // chats = response.data['data'];
        // isloading = false;
      });
    } catch (e) {
      // isloading = false;
      setState(() {});
      debugPrint(e.toString());
    }
  }

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
              CustomTextFormField(controller: email, labelText: "Email"),
              SizedBox(height: 23),
              CustomTextFormField(controller: password, labelText: "Password"),
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
