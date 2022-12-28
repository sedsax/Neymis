import 'package:flutter/material.dart';
import 'package:neymis/providers/controller.dart';
import 'package:neymis/providers/theme_provider.dart';
import 'package:neymis/themes/theme_preferences.dart';
import 'package:neymis/themes/themes.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => Controller()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ],
      child: FutureBuilder(
        initialData: false,
        future: ThemePreferences.getTheme(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Provider.of<ThemeProvider>(context, listen: false).setTheme(turnOn: snapshot.data as bool);
            });
          }

          return Consumer<ThemeProvider>(
            builder: (_, notifier, __) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: notifier.isDark ? darkTheme : lightTheme,
              home: const HomePage(),
            ),
          );
        },
      ),
    );
  }
}
