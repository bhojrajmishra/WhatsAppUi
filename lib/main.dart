import 'package:flutter/material.dart';
import 'package:flutter_first_ui/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            useMaterial3: true,
            fontFamily: "Poppins"),
        home: LoginScreen(),
      ),
    );
  }
}
