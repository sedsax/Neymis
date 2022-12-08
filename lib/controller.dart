import 'package:flutter/material.dart';
import 'package:neymis/constants/answer_stages.dart';
import 'package:neymis/models/tile_model.dart';

class Controller extends ChangeNotifier {

  int currentTile=0, currentRow=0;
  List<TileModel> tilesEntered = [];

  setKeyTapped({required String value}) {
    if(value=='SOR') {
      if(currentTile == 5*(currentRow+1)) {
        print('kelimeyi kontrol et');
      }

    }else if(value=='SİL'){
      if(currentTile>5*(currentRow+1)-5) {
        currentTile--;
        tilesEntered.removeLast();
      }

    }else{
      if(currentTile<5*(currentRow+1)) {
        tilesEntered.add(TileModel(letter: value, answerStage: AnswerStage.notAnswered));
        currentTile++;
      }
    }
    notifyListeners();
    //print('current tile $currentTile and currentRow $currentRow');
  }

}