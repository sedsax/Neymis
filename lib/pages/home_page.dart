import 'package:flutter/material.dart';

import '../components/grid.dart';
import '../components/keyboard_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NEYMİŞ?"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 7,
              child: Container(
                color: Colors.yellow,
                child: const Grid(),
              )),
          Expanded(
              flex: 4,
              child: Container(
                color: Colors.green,
                child: Column(
                  children: const [
                    KeyboardRow(min: 1, max: 12),
                    KeyboardRow(min: 13, max: 23),
                    KeyboardRow(min: 24, max: 34),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}




