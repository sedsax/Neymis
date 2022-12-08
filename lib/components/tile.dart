import 'package:flutter/material.dart';
import 'package:neymis/controller.dart';
import 'package:provider/provider.dart';

class Tile extends StatelessWidget {
  const Tile({ required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (_, notifier, __) {
        String text="";
        if(index < notifier.tilesEntered.length) {
          text=notifier.tilesEntered[index].letter;
          return Center(child: Text(text));
        }else{return const SizedBox();}
      });
  }
}