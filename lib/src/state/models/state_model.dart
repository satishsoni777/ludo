import 'package:ludo_game/src/travelingBox/blue_traveling.dart';
import 'package:ludo_game/src/travelingBox/green.dart';
import 'package:ludo_game/src/travelingBox/red_traveling.dart';
import 'package:ludo_game/src/travelingBox/yellow.dart';
import 'package:ludo_game/src/traveling_paths/blue_traveling_path.dart';
import 'package:ludo_game/src/traveling_paths/yellow_travelling.path.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

import '../traveling_paths.dart';

class CurrentBlueTravelingPath {
  int index1;
  int index2;
  PlayerCode playerCode;
  int currentPosition;
  CurrentBlueTravelingPath(
      {this.index1 = -1,
      this.index2 = -1,
      this.currentPosition = -1,
      this.playerCode = PlayerCode.HOME});
}

class CurrentYellowTravelingPath {
  int index1;
  int index2;
  PlayerCode playerCode;
  int currentPosition;
  CurrentYellowTravelingPath(
      {this.index1 = -1,
      this.index2 = -1,
      this.currentPosition = -1,
      this.playerCode = PlayerCode.HOME});
}

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
  Map<int, CurrentBlueTravelingPath> currentLocationBlueToken = {
    1: CurrentBlueTravelingPath(),
    2: CurrentBlueTravelingPath(),
    3: CurrentBlueTravelingPath(),
    4: CurrentBlueTravelingPath(),
  };
  Map<int, CurrentYellowTravelingPath> currentLocationYellowToken = {
    1: CurrentYellowTravelingPath(),
    2: CurrentYellowTravelingPath(),
    3: CurrentYellowTravelingPath(),
    4: CurrentYellowTravelingPath(),
  };
  void findLocation() {
    notifyListeners();
  }

  void moveForBlue(int number,
      {CurrentBlueTravelingPath currentLocation, int blueTokenId}) {
    print('dice nu,menr $number');
    if (blueTokenId == 1 &&
        number == 6 &&
        currentLocation.playerCode == PlayerCode.HOME) {
      updateCurrentLocationForBlue(
          MoveForBlue(
              index1: 1, index2: 2, playerCode: PlayerCode.BLUE, location: 0),
          currentLocation: 0);
      print('first time');
    } else if (blueTokenId == 2) {
    } else if (blueTokenId == 3) {
    } else if (blueTokenId == 4) {
    } else {
      print('else ');
      if (currentLocation.currentPosition >= 0) {
        updateCurrentLocationForBlue(
            movesForBluePath[currentLocation.currentPosition + 4],
            currentLocation: currentLocation.currentPosition + 4);
      }
    }

    notifyListeners();
  }

  void moveForYellow(int number,
      {CurrentYellowTravelingPath currentLocation, int yellowTokenId}) {
    if (yellowTokenId == 1 &&
        number == 6 &&
        currentLocation.playerCode == PlayerCode.HOME) {
      updateCurrentLocationForYellow(
          MoveForYellow(
              index1: 2, index2: 4, playerCode: PlayerCode.YELLOW, location: 0),
          currentLocation: 0);
      print('first time');
    } else if (yellowTokenId == 2) {
    } else if (yellowTokenId == 3) {
    } else if (yellowTokenId == 4) {
    } else {
      print('else ');
      if (currentLocation.currentPosition >= 0) {
        updateCurrentLocationForYellow(
            movesForYellowPath[currentLocation.currentPosition + 4],
            currentLocation: currentLocation.currentPosition + 4);
      }
    }

    notifyListeners();
  }

  void updateCurrentLocationForBlue(MoveForBlue moveForBlue,
      {int currentLocation}) {
    print('playe coe ${moveForBlue.playerCode}');
    currentLocationBlueToken[1].index1 = moveForBlue.index1;

    currentLocationBlueToken[1].index2 = moveForBlue.index2;

    currentLocationBlueToken[1].playerCode = moveForBlue.playerCode;

    currentLocationBlueToken[1].currentPosition = currentLocation;
  }

  void updateCurrentLocationForYellow(MoveForYellow moveForBlue,
      {int currentLocation}) {
    print('playe coe ${moveForBlue.playerCode}');
    currentLocationYellowToken[1].index1 = moveForBlue.index1;

    currentLocationYellowToken[1].index2 = moveForBlue.index2;

    currentLocationYellowToken[1].playerCode = moveForBlue.playerCode;

    currentLocationYellowToken[1].currentPosition = currentLocation;
  }

  int blueLastIndex;
  int findIndexInBlueTravelingPath(MoveForBlue moveForBlue) {
    int count = -1;
    for (BlueTravelingPath blue in blueTravelingPath) {
      count++;
      if (moveForBlue.index1 == blue.index1 &&
          moveForBlue.index2 == blue.index2) {
        print('value');
        print(count);
        blueLastIndex = count;
        break;
      }
    }
    return count;
  }

  void updateBlueTravelingPath({int index, PlayerCode playerCode}) {
    blueTravelingPath[index].playerCode = PlayerCode.BLUE;
  }

  void moveForGreen() {}
  void moveForRed() {}

  void findCurrentLocationInTravelingPath() {}
}
