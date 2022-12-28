import 'package:flutter/material.dart';
import 'package:neymis/constants/answer_stages.dart';
import 'package:neymis/constants/colors.dart';
import 'package:neymis/providers/controller.dart';
import 'package:provider/provider.dart';

import '../data/keys_map.dart';

class KeyboardRow extends StatelessWidget {
  const KeyboardRow({ required this.min, required this.max,
    Key? key,
  }) : super(key: key);

  final int min, max;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<Controller>(
      builder: (_, notifier, __) {
        int index = 0;
        return Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: keysMap.entries.map((e) {
            index++;
            //print("index os $index of key: ${e.key}");
            if(index >= min && index <= max) {
              Color? color = Theme.of(context).primaryColorLight;
              Color keyColor = Colors.white;
              if(e.value == AnswerStage.correct) {
                color = correctGreen;
              }else if(e.value == AnswerStage.contains) {
                color = containsYellow;
              }else if(e.value == AnswerStage.incorrect){
                color = Theme.of(context).primaryColorDark;
              }else{
                keyColor = Theme.of(context).textTheme.bodyText2?.color ?? Colors.black;
              }


              return Padding(
                padding: EdgeInsets.all(size.width*0.006),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: SizedBox(
                    width: e.key == 'SOR' || e.key == 'SİL' ? size.width*0.11 : size.width*0.07,
                   // width: size.width*0.07,
                      height: size.height*0.09,
                      child: Material(
                        color: color,
                        child: InkWell(
                          onTap: (){
                            Provider.of<Controller>(context, listen: false).setKeyTapped(value: e.key);
                          },
                            child: Center(child:
                                e.key == 'SİL' ? const Icon(Icons.backspace_outlined) :
                            Text(e.key, style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                color: keyColor,
                              )
                              ,))),
                      )),
                ),
              );
            }else{
              return const SizedBox();
            }

          }).toList()
      );
      },
    );
  }
}