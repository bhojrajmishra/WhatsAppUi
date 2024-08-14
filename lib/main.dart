import 'package:flutter/material.dart';
import 'package:flutter_first_ui/screens/login_screen.dart';
import 'package:flutter_first_ui/themes/light_mode.dart';

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
        home: login_screen(),
        theme: CustomTheme.lightTheme(),
      ),
    );
  }
}
