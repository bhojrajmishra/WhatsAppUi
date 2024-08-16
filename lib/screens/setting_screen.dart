import 'package:flutter/material.dart';
import 'package:flutter_first_ui/providers/theme_mode_model.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeModeModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Theme Mode"),
            Row(
              children: [
                Switch(
                    value: context.watch<ThemeModeModel>().isDarkMode,
                    onChanged: (value) {
                      themeProvider.updateMode(darkMode: value);
                    }),
                SizedBox(
                  width: 20,
                ),
                Text(themeProvider.isDarkMode ? "Dark Mode" : "Light Mode"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
