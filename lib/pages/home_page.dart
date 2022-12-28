import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neymis/components/stats_box.dart';
import 'package:neymis/constants/words.dart';
import 'package:neymis/pages/settings.dart';
import 'package:neymis/providers/controller.dart';
import 'package:neymis/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../components/grid.dart';
import '../components/keyboard_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late String _word;

  @override
  void initState() {
    final r = Random().nextInt(words.length);
    _word = words[r];

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Controller>(context, listen: false).setCorrectWord(word: _word);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Neymiş?"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context, builder: (_) => StatsBox());
          },
              icon: Icon(Icons.bar_chart_outlined)),
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Settings()));
          },
              icon: const Icon(Icons.settings)
          )
        ],
      ),
      body: Column(
        children: [
          const Divider(
            height: 1,
            thickness: 2,
          ),
          const Expanded(
              flex: 7,
              child: Grid()),
          Expanded(
              flex: 4,
              child: Column(
                children: const [
                  KeyboardRow(min: 1, max: 10),
                  KeyboardRow(min: 11, max: 21),
                  KeyboardRow(min: 22, max: 32),
                ],
              )),
        ],
      ),
    );
  }
}




