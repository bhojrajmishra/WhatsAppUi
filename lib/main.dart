import 'package:flutter/material.dart';
import 'package:flutter_first_ui/providers/send_message_model.dart';
import 'package:flutter_first_ui/screens/login_screen.dart';
import 'package:flutter_first_ui/themes/custom_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SendMessageModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        theme: CustomTheme.lightTheme(),
      ),
    );
  }
}
