import 'package:flutter/material.dart';
import 'package:neymis/constants/colors.dart';
import 'package:neymis/controller.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Controller())
    ],

      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColorLight: lightThemeLightShade,
        primaryColorDark: lightThemeDarkShade,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
        ),
            scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme().copyWith(
          bodyText2: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
        )
      ),
      home: const HomePage(),
    );
  }
}
