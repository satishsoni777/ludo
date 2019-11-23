import 'package:ludo_game/src/state/traveling_paths.dart';
import 'package:ludo_game/src/token_paths/green_travleling_path.dart';
import 'package:ludo_game/src/token_paths/yellow_travelling.path.dart';
import 'package:ludo_game/src/travelingBox/blue_traveling.dart';
import 'package:ludo_game/src/travelingBox/green.dart';
import 'package:ludo_game/src/travelingBox/red_traveling.dart';
import 'package:ludo_game/src/travelingBox/yellow.dart';
import 'package:ludo_game/src/token_paths/blue_traveling_path.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

class CurrentBlueTravelingPath {
  int index1;
  int index2;
  PlayerCode playerCode;
  int currentPosition;
  int tokenId;
  PlayerCode tokenName;
  CurrentBlueTravelingPath(
      {this.index1 = -1,
      this.index2 = -1,
      this.tokenName = PlayerCode.BLUE,
      this.currentPosition = -1,
      this.tokenId,
      this.playerCode = PlayerCode.HOME});
}

class CurrentYellowTravelingPath {
  int index1;
  int index2;
  PlayerCode playerCode;
  int currentPosition;
  int tokenId;
  PlayerCode tokenName;
  CurrentYellowTravelingPath(
      {this.index1 = -1,
      this.index2 = -1,
      this.tokenName = PlayerCode.YELLOW,
      this.currentPosition = -1,
      this.tokenId,
      this.playerCode = PlayerCode.HOME});
}

class CurrentGreenTravelingPath {
  int index1;
  int index2;
  PlayerCode playerCode;
  int currentPosition;
  int tokenId;
  PlayerCode tokenName;
  CurrentGreenTravelingPath(
      {this.index1 = -1,
      this.index2 = -1,
      this.currentPosition = -1,
      this.tokenId,
      this.tokenName = PlayerCode.GREEN,
      this.playerCode = PlayerCode.HOME});
}

class CurrentRedTravelingPath {
  int index1;
  int index2;
  PlayerCode playerCode;
  int currentPosition;
  int tokenId;
  PlayerCode tokenName;
  CurrentRedTravelingPath(
      {this.index1 = -1,
      this.index2 = -1,
      this.tokenId,
      this.tokenName = PlayerCode.RED,
      this.currentPosition = -1,
      this.playerCode = PlayerCode.HOME});
}

class StateModel extends Model {
  int index;
  int index1;
  int diceNumber = 0;
  PlayerCode playerTurn = PlayerCode.BLUE;
  List<BluePath> bluePath = [];
  List<YellowPath> yellowPath = [];
  List<RedPath> redPath = [];
  List<GreenPath> greenPath = [];
  List<BlueTravelingPath> blueTravelingPath = [];
  List<YellowTravelingPath> yellowTravelingPath = [];
  List<GreenTravelingPath> greenTravelingPath = [];
  List<RedTravelingPath> redTravelingPath = [];
  // Map<PlayerCode, Map<int, CurrentBlueTravelingPath>> cur = {
  //   PlayerCode.BLUE: {
  //     1: CurrentBlueTravelingPath(tokenId: 1),
  //     2: CurrentBlueTravelingPath(tokenId: 2),
  //     3: CurrentBlueTravelingPath(tokenId: 3),
  //     4: CurrentBlueTravelingPath(tokenId: 4),
  //   }
  // };
  Map<int, CurrentBlueTravelingPath> currentLocationBlueToken = {
    1: CurrentBlueTravelingPath(tokenId: 1),
    2: CurrentBlueTravelingPath(tokenId: 2),
    3: CurrentBlueTravelingPath(tokenId: 3),
    4: CurrentBlueTravelingPath(tokenId: 4),
  };
  Map<int, CurrentYellowTravelingPath> currentLocationYellowToken = {
    1: CurrentYellowTravelingPath(tokenId: 1),
    2: CurrentYellowTravelingPath(tokenId: 2),
    3: CurrentYellowTravelingPath(tokenId: 3),
    4: CurrentYellowTravelingPath(tokenId: 4),
  };
  Map<int, CurrentGreenTravelingPath> currentLocationGreenToken = {
    1: CurrentGreenTravelingPath(tokenId: 1),
    2: CurrentGreenTravelingPath(tokenId: 2),
    3: CurrentGreenTravelingPath(tokenId: 3),
    4: CurrentGreenTravelingPath(tokenId: 4),
  };
  Map<int, CurrentRedTravelingPath> currentLocationRedToken = {
    1: CurrentRedTravelingPath(tokenId: 1),
    2: CurrentRedTravelingPath(tokenId: 2),
    3: CurrentRedTravelingPath(tokenId: 3),
    4: CurrentRedTravelingPath(tokenId: 4),
  };

  /// moves for blue token
  void moveForBlue(int number,
      {CurrentBlueTravelingPath currentLocation, int blueTokenId}) {
    if (number == 6 && currentLocation.playerCode == PlayerCode.HOME) {
      updateCurrentLocationForBlue(
          MoveForBlue(
            index1: 1,
            index2: 2,
            playerCode: PlayerCode.BLUESTAR,
            location: 0,
          ),
          tokenId: blueTokenId,
          currentLocation: 0);
    } else {
      if (currentLocation.currentPosition >= 0 &&
          (number + currentLocation.currentPosition) < 55) {
        updateCurrentLocationForBlue(
            movesForBluePath[currentLocation.currentPosition + number],
            currentLocation: currentLocation.currentPosition + number,
            tokenId: blueTokenId);
      } else if (number + currentLocation.currentPosition == 56) {
        print('home');
        updateCurrentLocationForBlue(
            movesForBluePath[currentLocation.currentPosition + number - 1],
            currentLocation: currentLocation.currentPosition + number - 1,
            tokenId: blueTokenId,
            playerCode: PlayerCode.BLUEHOME);
      }
    }
    diceNumber = 0;
    notifyListeners();
  }

  void updateCurrentLocationForBlue(MoveForBlue moveForBlue,
      {int currentLocation, int tokenId, PlayerCode playerCode}) {
    currentLocationBlueToken[tokenId] = CurrentBlueTravelingPath(
        currentPosition: currentLocation,
        index1: moveForBlue.index1,
        index2: moveForBlue.index2,
        playerCode: playerCode ?? moveForBlue.playerCode,
        tokenId: tokenId);
    diceNumber = 0;
  }

  /// Move for yellow token
  void moveForYellow(int number,
      {CurrentYellowTravelingPath currentLocation, int yellowTokenId}) {
    if (number == 6 && currentLocation.playerCode == PlayerCode.HOME) {
      updateCurrentLocationForYellow(
          MoveForYellow(
            index1: 2,
            index2: 4,
            playerCode: PlayerCode.YELLOWSTAR,
            location: 0,
          ),
          currentLocation: 0,
          tokenId: yellowTokenId);
    } else {
      if (currentLocation.currentPosition >= 0 &&
          (number + currentLocation.currentPosition) < 55) {
        updateCurrentLocationForYellow(
          movesForYellowPath[currentLocation.currentPosition + number],
          currentLocation: currentLocation.currentPosition + number,
          tokenId: yellowTokenId,
        );
      } else if (number + currentLocation.currentPosition == 56) {
        updateCurrentLocationForYellow(
          movesForYellowPath[currentLocation.currentPosition + number - 1],
          currentLocation: currentLocation.currentPosition + number - 1,
          playerCode: PlayerCode.YELLOWHOME,
          tokenId: yellowTokenId,
        );
      }
    }

    diceNumber = 0;
    notifyListeners();
  }

  void updateCurrentLocationForYellow(MoveForYellow moveForYellow,
      {int currentLocation, int tokenId, PlayerCode playerCode}) {
    currentLocationYellowToken[tokenId] = CurrentYellowTravelingPath(
        index1: moveForYellow.index1,
        index2: moveForYellow.index2,
        playerCode: playerCode ?? moveForYellow.playerCode,
        tokenId: tokenId,
        currentPosition: currentLocation);
  }

  /// traveling logic for green
  void moveForGreen(int number,
      {CurrentGreenTravelingPath currentLocation, int tokenId}) {
    if (number == 6 && currentLocation.playerCode == PlayerCode.HOME) {
      updateCurrentLocationForGreen(
          MoveForGreen(
            index1: 4,
            index2: 0,
            playerCode: PlayerCode.GREENSTAR,
            location: 0,
          ),
          tokenId: tokenId,
          currentLocation: 0);
    } else {
      if (currentLocation.currentPosition >= 0 &&
          (number + currentLocation.currentPosition) < 55) {
        updateCurrentLocationForGreen(
            movesForGreenPath[currentLocation.currentPosition + number],
            currentLocation: currentLocation.currentPosition + number,
            tokenId: tokenId);
      } else if (number + currentLocation.currentPosition == 56) {
        print('home');
        updateCurrentLocationForGreen(
            movesForGreenPath[currentLocation.currentPosition + number - 1],
            currentLocation: currentLocation.currentPosition + number - 1,
            tokenId: tokenId,
            playerCode: PlayerCode.BLUEHOME);
      }
    }
    diceNumber = 0;
    notifyListeners();
  }

  void updateCurrentLocationForGreen(MoveForGreen moveForGreen,
      {int currentLocation, int tokenId, PlayerCode playerCode}) {
    currentLocationGreenToken[tokenId] = CurrentGreenTravelingPath(
        currentPosition: currentLocation,
        index1: moveForGreen.index1,
        index2: moveForGreen.index2,
        playerCode: playerCode ?? moveForGreen.playerCode,
        tokenId: tokenId);
    diceNumber = 0;
  }

  void moveForRed() {}
}
