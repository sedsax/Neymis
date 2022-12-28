import 'package:flutter/material.dart';
import 'package:neymis/constants/answer_stages.dart';
import 'package:neymis/data/keys_map.dart';
import 'package:neymis/models/tile_model.dart';

class Controller extends ChangeNotifier {
  bool checkLine = false, backOrEnterTapped = false, gameWon=false;
  bool gameCompleted = false;
  String correctWord = "";

  int currentTile=0, currentRow=0;
  List<TileModel> tilesEntered = [];

  setCorrectWord({required String word}) => correctWord = word;

  setKeyTapped({required String value}) {
    if(value=='SOR') {
      if(currentTile == 5*(currentRow+1)) {
        backOrEnterTapped = true;
      //  currentRow++;
        checkWord();
       // print('kelimeyi kontrol et');
      }

    }else if(value=='SİL'){
      if(currentTile>5*(currentRow+1)-5) {
        currentTile--;
        tilesEntered.removeLast();
        backOrEnterTapped = true;
      }

    }else{
      if(currentTile<5*(currentRow+1)) {
        tilesEntered.add(TileModel(letter: value, answerStage: AnswerStage.notAnswered));
        currentTile++;
        backOrEnterTapped = false;
      }
    }
    notifyListeners();
    //print('current tile $currentTile and currentRow $currentRow');
  }

  checkWord() {
    List<String> guessed = [], remainingCorrect = [];
    String guessedWord = "";

    for(int i=currentRow*5; i<(currentRow*5)+5; i++) {
      guessed.add(tilesEntered[i].letter);
    }

    guessedWord = guessed.join();
    remainingCorrect = correctWord.characters.toList();

    if(guessedWord==correctWord){
      //print("dogru kelime");
      for(int i=currentRow*5; i<(currentRow*5)+5; i++) {
        tilesEntered[i].answerStage = AnswerStage.correct;
        keysMap.update(tilesEntered[i].letter, (value) => AnswerStage.correct);
        gameWon = true;
        gameCompleted = true;
      }
    }else{
      for(int i=0; i<5; i++) {
        if(guessedWord[i]==correctWord[i]){
          remainingCorrect.remove(guessedWord[i]);
          tilesEntered[i + (currentRow*5)].answerStage = AnswerStage.correct;
          keysMap.update(guessedWord[i], (value) => AnswerStage.correct);
         // print("tahmin kelime harfi ${guessedWord[i]}");
        }
      }

      for(int i=0; i<remainingCorrect.length; i++) {
        for(int j=0; j<5; j++) {
          if(remainingCorrect[i] == tilesEntered[j+ (currentRow*5)].letter){
            if(tilesEntered[j + (currentRow*5)].answerStage != AnswerStage.correct) {
              tilesEntered[j + (currentRow*5)].answerStage = AnswerStage.contains;
            }

            final resultKey = keysMap.entries.where((element) => element.key == tilesEntered[j + (currentRow*5)].letter);

            if(resultKey.single.value != AnswerStage.correct) {
              keysMap.update(resultKey.single.key, (value) => AnswerStage.contains);
            }
           // print("içeriyor ${remainingCorrect[i]}");
          }
        }
      }
      for(int i=currentRow*5; i<(currentRow*5)+5; i++) {
        if(tilesEntered[i].answerStage == AnswerStage.notAnswered) {
          tilesEntered[i].answerStage = AnswerStage.incorrect;
          keysMap.update(tilesEntered[i].letter, (value) => AnswerStage.incorrect);
        }
      }

    }

    if(currentRow == 6) {
      gameCompleted = true;
    }

    if(gameCompleted) {
      // calculateStats();
    }
    currentRow++;
    checkLine = true;
    notifyListeners();
  }

}