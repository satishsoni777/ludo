import 'package:ludo_game/src/travelingBox/blue_traveling.dart';
import 'package:ludo_game/src/travelingBox/green.dart';
import 'package:ludo_game/src/travelingBox/red_traveling.dart';
import 'package:ludo_game/src/travelingBox/yellow.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

import '../game_logic.dart';

class StateModel extends Model {
  GameLogic gameLogic;
  int index;
  int index1;
  List<BluePath> bluePath;
  List<RedPath> redPath;
  List<GreenPath> greenPath;
  List<BlueTravelingPath> bluePathTraveling;
  List<YellowPath> yellowPath;
  StateModel() {}
  void findLocation() {
    notifyListeners();
  }

  void moveForBlue() {}
  void moveForYellow() {}
  void moveForGreen() {}
  void moveForRed() {}
}

class MoveForBlue {
  int index1;
  int index2;
  PlayerCode playerCode;
  MoveForBlue({this.index1, this.index2, this.playerCode = PlayerCode.BLUE});
}

List<MoveForBlue> movesForBlue = [
  MoveForBlue(
    index1: 1,
    index2: 2,
  ),
  MoveForBlue(
    index1: 2,
    index2: 2,
  ),
  MoveForBlue(
    index1: 3,
    index2: 2,
  ),
  MoveForBlue(
    index1: 4,
    index2: 2,
  ),
  MoveForBlue(
    index1: 5,
    index2: 2,
  ),
  MoveForBlue(index1: 0, index2: 0, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 0, index2: 1, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 0, index2: 2, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 0, index2: 3, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 0, index2: 4, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 0, index2: 5, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 1, index2: 5, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 2, index2: 5, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 2, index2: 4, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 2, index2: 3, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 2, index2: 2, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 2, index2: 1, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 2, index2: 0, playerCode: PlayerCode.YELLOW),
];
