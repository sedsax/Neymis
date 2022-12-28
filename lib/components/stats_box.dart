import 'package:flutter/material.dart';
import 'package:neymis/components/stats_tile.dart';
import 'package:neymis/constants/answer_stages.dart';
import 'package:neymis/data/keys_map.dart';
import 'package:neymis/main.dart';

class StatsBox extends StatelessWidget {
  const StatsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IconButton(
              alignment: Alignment.centerRight,
              onPressed: () {},
              icon: Icon(Icons.clear)),
          Expanded(
              child: Text(
            "STATISTICS",
            textAlign: TextAlign.center,
          )),
          Expanded(child: Row(
            children: [
              StatsTile(heading: 'Oynanan',value: 50,),
              StatsTile(heading: 'Skor %',value: 90,),
              StatsTile(heading: 'Current\nStreak',value: 12,),
              StatsTile(heading: 'Max\nStreak',value: 15,),
            ],
          )),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
                onPressed: (){
                keysMap.updateAll((key, value) => value = AnswerStage.notAnswered);
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                        (route) => false);
                },
                child: Text('Replay', style: TextStyle(fontSize: 30),)),
          ),
        ],
      ),
    );
  }
}
