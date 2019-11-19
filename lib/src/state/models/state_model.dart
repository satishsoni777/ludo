import 'package:ludo_game/src/travelingBox/blue_traveling.dart';
import 'package:ludo_game/src/travelingBox/green.dart';
import 'package:ludo_game/src/travelingBox/red_traveling.dart';
import 'package:ludo_game/src/travelingBox/yellow.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

import '../traveling_paths.dart';

class StateModel extends Model {
  int index;
  int index1;
  List<BluePath> bluePath = [];
  List<YellowPath> yellowPath = [];
  List<RedPath> redPath = [];
  List<GreenPath> greenPath = [];
  List<BlueTravelingPath> blueTravelingPath = [];
  List<YellowTravelingPath> yellowTravelingPath = [];
  List<GreenTravelingPath> greenTravelingPath = [];
  List<RedTravelingPath> redTravelingPath = [];
  Map<int, BlueTravelingPath> currentLocationBlueToken = {
    1: BlueTravelingPath(index1: 1, index2: 2, playerCode: PlayerCode.HOME),
  };
  Map<int, YellowTravelingPath> currentLocationYellowToken = {
    1: YellowTravelingPath(index1: 2, index2: 4, playerCode: PlayerCode.HOME),
  };
  // Map<int,Yell>

  void findLocation() {
    notifyListeners();
  }

  void moveForBlue(int number, {BlueTravelingPath currentLocation}) {
    int count = -1;
    bool isFound = false;
    for (MoveForBlue movesForBlue in movesForBluePath) {
      count++;
      if (movesForBlue.index1 == currentLocation.index1 &&
          movesForBlue.index2 == currentLocation.index2 &&
          movesForBlue.playerCode == currentLocation.playerCode) {
        this.currentLocationBlueToken[1].index1 = movesForBlue.index1;
        this.currentLocationBlueToken[1].index2 = movesForBlue.index2;
        this.currentLocationBlueToken[1].playerCode = movesForBlue.playerCode;
        isFound = true;
        break;
      }
    }
    if (isFound) {
      final playerCode = movesForBluePath[count + number].playerCode;
      if (playerCode == PlayerCode.BLUE) {
        this.currentLocationBlueToken[1].index1 =
            movesForBluePath[count + number].index1;
        this.currentLocationBlueToken[1].index2 =
            movesForBluePath[count + number].index2;
        this.currentLocationBlueToken[1].playerCode = playerCode;
        print(playerCode);
      } else if (playerCode == PlayerCode.GREEN) {
        print(playerCode);
      } else if (playerCode == PlayerCode.YELLOW) {
        print(playerCode);
      } else if (playerCode == PlayerCode.RED) {
        print(playerCode);
      }
    }
    notifyListeners();
  }

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

List<MoveForBlue> movesForBluePath = [
  MoveForBlue(index1: 1, index2: 2, playerCode: PlayerCode.HOME),
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

  // yellow path
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

// green path
  MoveForBlue(index1: 0, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 1, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 2, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 3, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 4, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 5, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 5, index2: 1, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 5, index2: 0, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 4, index2: 0, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 3, index2: 0, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 2, index2: 0, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 1, index2: 0, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 0, index2: 0, playerCode: PlayerCode.GREEN),

  // red path
  MoveForBlue(index1: 0, index2: 2, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 1, index2: 2, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 2, index2: 2, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 3, index2: 2, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 4, index2: 2, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 5, index2: 2, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 5, index2: 1, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 5, index2: 0, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 4, index2: 0, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 3, index2: 0, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 2, index2: 0, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 1, index2: 0, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 0, index2: 0, playerCode: PlayerCode.RED),

  // blue path
  MoveForBlue(index1: 0, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForBlue(index1: 1, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForBlue(index1: 2, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForBlue(index1: 3, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForBlue(index1: 4, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForBlue(index1: 5, index2: 2, playerCode: PlayerCode.BLUE),
];
