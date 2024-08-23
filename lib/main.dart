import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/chat_view/view_model/chat_view_model.dart';
import 'package:flutter_first_ui/ui/home_view/view_model/home_view_model.dart';
import 'package:flutter_first_ui/ui/home_view/view_model/loading_view_model.dart';
import 'package:flutter_first_ui/ui/login_view/login_view.dart';
import 'package:flutter_first_ui/themes/theme_model/theme_model.dart';
import 'package:flutter_first_ui/themes/custom_theme.dart';
import 'package:flutter_first_ui/ui/login_view/view_model/login_view_model.dart';
import 'package:flutter_first_ui/ui/registration_view/models/registration_model.dart';
import 'package:flutter_first_ui/ui/registration_view/view_model/registration_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ChatViewModel()),
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: LoadingViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegistrationViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      theme: themeProvider.isDarkMode
          ? CustomTheme.darkTheme()
          : CustomTheme.lightTheme(),
    );
  }
}
