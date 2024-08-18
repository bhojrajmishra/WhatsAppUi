import 'package:flutter/material.dart';
import 'package:flutter_first_ui/viewmodel/providers/loading_screen.dart';
import 'package:flutter_first_ui/viewmodel/providers/send_message.dart';
import 'package:flutter_first_ui/viewmodel/providers/theme_mode.dart';
import 'package:flutter_first_ui/view/screens/login_screen.dart';
import 'package:flutter_first_ui/themes/custom_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider.value(value: SendMessage()),
      ChangeNotifierProvider.value(value: ThemeModeModel()),
      ChangeNotifierProvider.value(value: LoadingScreen()),
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
