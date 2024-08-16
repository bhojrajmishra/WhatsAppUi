import 'package:flutter/material.dart';
import 'package:flutter_first_ui/providers/send_message.dart';
import 'package:flutter_first_ui/providers/theme_mode_model.dart';
import 'package:flutter_first_ui/screens/login_screen.dart';
import 'package:flutter_first_ui/themes/custom_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider.value(value: SendMessageModel()),
      ChangeNotifierProvider.value(value: ThemeModeModel()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeModeModel>(context);
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        theme: themeProvider.isDarkMode
            ? CustomTheme.darkTheme()
            : CustomTheme.lightTheme(),
      ),
    );
  }
}
