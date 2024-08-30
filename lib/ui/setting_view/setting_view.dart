import 'package:flutter/material.dart';
import 'package:flutter_first_ui/components/user_app_bar.dart';
import 'package:flutter_first_ui/themes/theme_model/theme_modification.dart';
import 'package:provider/provider.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeModification>();
    return Scaffold(
      appBar: const UserAppBar(title: 'Setting'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Theme Mode"),
            Row(
              children: [
                Switch(
                    value: context.watch<ThemeModification>().isDarkMode,
                    onChanged: (value) {
                      themeProvider.updateMode(darkMode: value);
                    }),
                const SizedBox(
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
