import 'package:flutter/material.dart';
import 'package:neymis/constants/answer_stages.dart';
import 'package:neymis/constants/colors.dart';
import 'package:neymis/controller.dart';
import 'package:provider/provider.dart';

class Tile extends StatefulWidget {
  const Tile({ required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {

  Color _backgroundColor = Colors.transparent;
  late AnswerStage _answerStage;

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (_, notifier, __) {
        String text="";
        Color fontColor = Colors.white;

        if(widget.index < notifier.tilesEntered.length) {
          text=notifier.tilesEntered[widget.index].letter;
          _answerStage = notifier.tilesEntered[widget.index].answerStage;
          if(_answerStage == AnswerStage.correct) {
            _backgroundColor = correctGreen;
          }else if(_answerStage == AnswerStage.contains){
            _backgroundColor = containsYellow;
          }else if(_answerStage == AnswerStage.incorrect){
            _backgroundColor = Theme.of(context).primaryColorDark;
          }else{
            fontColor = Theme.of(context).textTheme.bodyText2?.color ?? Colors.black;
          }

          return Container(
              color: _backgroundColor,
              child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(text, style: const TextStyle().copyWith(
                      color: fontColor
                    ),),
                  )));
        }else{return const SizedBox();}
      });
  }
}