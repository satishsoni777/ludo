import 'package:ludo_game/src/state/traveling_paths.dart';
import 'package:ludo_game/src/token_paths/green_travleling_path.dart';
import 'package:ludo_game/src/token_paths/red_travleling_path.dart';
import 'package:ludo_game/src/token_paths/yellow_travelling.path.dart';
import 'package:ludo_game/src/travelingBox/blue_traveling.dart';
import 'package:ludo_game/src/travelingBox/green.dart';
import 'package:ludo_game/src/travelingBox/red_traveling.dart';
import 'package:ludo_game/src/travelingBox/yellow.dart';
import 'package:ludo_game/src/token_paths/blue_traveling_path.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

// abstract class TokensCurrentLocation {}

class CurrentBlueTravelingPath {
  int index1;
  int index2;
  final bool isTwice;
  PlayerCode playerCode;
  int currentPosition;
  int tokenId;
  PlayerCode tokenName;
  PlayerCode tokenStatus;
  CurrentBlueTravelingPath(
      {this.index1 = -1,
      this.isTwice = false,
      this.index2 = -1,
      this.tokenName = PlayerCode.BLUE,
      this.currentPosition = -1,
      this.tokenStatus = PlayerCode.INSIDE_HOME,
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
  StateModel() {
    playerTurn = PlayerCode.BLUE;
    playingBoard = PlayingBoard.All;
  }

  TokenAction tokenAction = TokenAction.Pass;
  bool isRollAgain = false;
  PlayingBoard playingBoard;
  int countNumberOfSix = 0;
  int diceNumber = 0;
  PlayerCode playerTurn = PlayerCode.EMPTY;
  List<BluePath> bluePath = [];
  List<YellowPath> yellowPath = [];
  List<RedPath> redPath = [];
  List<GreenPath> greenPath = [];
  List<BlueTravelingPath> blueTravelingPath = [];
  List<YellowTravelingPath> yellowTravelingPath = [];
  List<GreenTravelingPath> greenTravelingPath = [];
  List<RedTravelingPath> redTravelingPath = [];

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

  // List<Map<int, TokensCurrentLocation>> tokensCurrentLocation = [];

  /// moves for blue token
  switchUserTurn(int dice, {PlayerCode playerCode}) {
    print('player switchUserTurn $playerCode');
    // if (diceNumber == 6) countNumberOfSix++;
    print('total six 6 $countNumberOfSix ');
    if (countNumberOfSix == 3 && tokenAction != TokenAction.BonusPoint) {
      print('1....');
      // switch user
      playerTurn = playerCode;
      countNumberOfSix = 0;
      tokenAction = TokenAction.Pass;
      isRollAgain = false;
      notifyListeners();
    } else if (diceNumber < 6 &&
        countNumberOfSix == 1 &&
        tokenAction != TokenAction.BonusPoint) {
      print('2....');
      // switch user
      countNumberOfSix = 0;
      playerTurn = playerCode;
      tokenAction = TokenAction.Pass;
      isRollAgain = false;
      notifyListeners();
    } else if (diceNumber < 6 &&
        countNumberOfSix == 2 &&
        tokenAction != TokenAction.BonusPoint) {
      print('3...');
      countNumberOfSix = 0;
      playerTurn = playerCode;
      tokenAction = TokenAction.Pass;
      isRollAgain = false;
      diceNumber = 0;
      notifyListeners();
    } else if (dice < 6 && tokenAction != TokenAction.BonusPoint) {
      print('4..');
      // switch user
      countNumberOfSix = 0;
      playerTurn = playerCode;
      tokenAction = TokenAction.Pass;
      isRollAgain = false;
      notifyListeners();
    } else {
      print('rolled again');
    }
  }

  void moveForBlue(int number,
      {CurrentBlueTravelingPath currentLocation, int blueTokenId}) {
    if (number == 6 && currentLocation.playerCode == PlayerCode.HOME) {
      updateCurrentLocationForBlue(
          MoveForBlue(
              index1: 1,
              index2: 2,
              playerCode: PlayerCode.STAR,
              location: 0,
              isSpecialPosition: true),
          tokenId: blueTokenId,
          currentLocation: 0);
    } else {
      tokenAction = TokenAction.Pass;
      if (currentLocation.currentPosition >= 0 &&
          (number + currentLocation.currentPosition) < 55) {
        print('under 55 blue');
        updateCurrentLocationForBlue(
            movesForBluePath[currentLocation.currentPosition + number],
            currentLocation: currentLocation.currentPosition + number,
            tokenId: blueTokenId);
      } else if (number + currentLocation.currentPosition == 56) {
        tokenAction = TokenAction.BonusPoint;
        isRollAgain = true;
        print('home');
        updateCurrentLocationForBlue(
            movesForBluePath[currentLocation.currentPosition + number - 1],
            currentLocation: currentLocation.currentPosition + number - 1,
            tokenId: blueTokenId,
            playerCode: PlayerCode.BLUEHOME);
      }
    }

    // if only token does not do this action than no need to call

    print('token action blue to green ${playingBoard}');
    switchUserTurn(number,
        playerCode: playingBoard == PlayingBoard.GREEN_BLUE
            ? PlayerCode.GREEN
            : PlayerCode.YELLOW);
    diceNumber = 0;
    notifyListeners();
  }

  void updateCurrentLocationForBlue(MoveForBlue moveForBlue,
      {int currentLocation, int tokenId, PlayerCode playerCode}) {
    bool isTwice = false;
    print('plaer code $playerCode');
    CurrentBlueTravelingPath blue = CurrentBlueTravelingPath(
        currentPosition: currentLocation,
        index1: moveForBlue.index1,
        index2: moveForBlue.index2,
        playerCode: playerCode ?? moveForBlue.playerCode,
        tokenId: tokenId);
    currentLocationBlueToken[tokenId] = blue;
    List<CurrentBlueTravelingPath> _list = [];
    currentLocationBlueToken.forEach((k, v) {
      _list.add(v);
    });

    // This logic is for to check if tokens are in paired or not.
    // for (int i = 0; i < _list.length - 1; i++) {
    //   for (int j = i + 1; j < _list.length; j++) {
    //     if (_list[i].index1 == _list[j].index1 &&
    //         _list[i].index2 == _list[j].index2 &&
    //         _list[i].playerCode != PlayerCode.HOME &&
    //         _list[j].playerCode != PlayerCode.HOME &&
    //         _list[i].playerCode != PlayerCode.STAR &&
    //         _list[j].playerCode != PlayerCode.STAR) {
    //       isTwice = true;
    //       currentLocationBlueToken[i] = CurrentBlueTravelingPath(
    //           currentPosition: currentLocation,
    //           index1: moveForBlue.index1,
    //           index2: moveForBlue.index2,
    //           playerCode: playerCode ?? moveForBlue.playerCode,
    //           tokenId: tokenId,
    //           isTwice: true);
    //       currentLocationBlueToken[j] = CurrentBlueTravelingPath(
    //           currentPosition: currentLocation,
    //           index1: moveForBlue.index1,
    //           index2: moveForBlue.index2,
    //           playerCode: playerCode ?? moveForBlue.playerCode,
    //           tokenId: tokenId,
    //           isTwice: true);
    //       break;
    //     }
    //   }
    //   if (isTwice) {
    //     break;
    //   }
    // }
    if (moveForBlue.isSpecialPosition == false)
      tokenKillingFromBlueToken(
          index1: moveForBlue.index1,
          index2: moveForBlue.index2,
          playerCode: moveForBlue.playerCode);
  }

  /// Move for yellow token
  void moveForYellow(int number,
      {CurrentYellowTravelingPath currentLocation, int yellowTokenId}) {
    if (number == 6 && currentLocation.playerCode == PlayerCode.HOME) {
      updateCurrentLocationForYellow(
          MoveForYellow(
            index1: 2,
            index2: 4,
            playerCode: PlayerCode.STAR,
            location: 0,
          ),
          currentLocation: 0,
          tokenId: yellowTokenId);
    } else {
      print('yellw ${currentLocation.currentPosition}');
      tokenAction = TokenAction.Pass;
      if (currentLocation.currentPosition >= 0 &&
          (number + currentLocation.currentPosition) < 55) {
        print('yellw undre 55');
        updateCurrentLocationForYellow(
          movesForYellowPath[currentLocation.currentPosition + number],
          currentLocation: currentLocation.currentPosition + number,
          tokenId: yellowTokenId,
        );
         isOutOfRange=false;
      }

      /// if Token is inside color box
      else if (number + currentLocation.currentPosition == 56) {
        print('home');
        tokenAction = TokenAction.BonusPoint;
        updateCurrentLocationForYellow(
          movesForYellowPath[currentLocation.currentPosition + number - 1],
          currentLocation: currentLocation.currentPosition + number - 1,
          playerCode: PlayerCode.YELLOWHOME,
          tokenId: yellowTokenId,
        );
         isOutOfRange=false;
      } else if (number + currentLocation.currentPosition > 56) {
        print('click in out of range');
        isOutOfRange=true;
      }
    }
    print('token action yellow to red ${tokenAction}');
     if (!isOutOfRange)
    switchUserTurn(number,
        playerCode: playingBoard == PlayingBoard.RED_YELLOW
            ? PlayerCode.RED
            : PlayerCode.GREEN);
    // switchUserTurn(number, playerCode: PlayerCode.GREEN);
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
    tokenKillingFromYellowToken(
        index1: moveForYellow.index1,
        index2: moveForYellow.index2,
        playerCode: moveForYellow.playerCode);
  }

  bool isOutOfRange = false;

  /// traveling logic for green
  void moveForGreen(int number,
      {CurrentGreenTravelingPath currentLocation, int tokenId}) {
    if (number == 6 && currentLocation.playerCode == PlayerCode.HOME) {
      updateCurrentLocationForGreen(
          MoveForGreen(
            index1: 4,
            index2: 0,
            playerCode: PlayerCode.STAR,
            location: 0,
          ),
          tokenId: tokenId,
          currentLocation: 0);
      isOutOfRange = false;
    } else {
      tokenAction = TokenAction.Pass;
      if (currentLocation.currentPosition >= 0 &&
          (number + currentLocation.currentPosition) < 55) {
        isOutOfRange = false;
        updateCurrentLocationForGreen(
            movesForGreenPath[currentLocation.currentPosition + number],
            currentLocation: currentLocation.currentPosition + number,
            tokenId: tokenId);
      } else if (number + currentLocation.currentPosition == 56) {
        isOutOfRange = true;
        print('home');
        tokenAction = TokenAction.BonusPoint;
        updateCurrentLocationForGreen(
            movesForGreenPath[currentLocation.currentPosition + number - 1],
            currentLocation: currentLocation.currentPosition + number - 1,
            tokenId: tokenId,
            playerCode: PlayerCode.GREENHOME);
      }
    }
    print('green to red');
    if (!isOutOfRange)
      switchUserTurn(number,
          playerCode: playingBoard == PlayingBoard.GREEN_BLUE
              ? PlayerCode.BLUE
              : PlayerCode.RED);
    // switchUserTurn(number, playerCode: PlayerCode.RED);

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
    tokenKillingFromGreenToken(
        index1: moveForGreen.index1,
        index2: moveForGreen.index2,
        playerCode: moveForGreen.playerCode);
  }

// move for red logic
  void moveForRed(int number,
      {CurrentRedTravelingPath currentLocation, int tokenId}) {
    if (number == 6 && currentLocation.playerCode == PlayerCode.HOME) {
      updateCurrentLocationForRed(
          MoveForRed(
            index1: 0,
            index2: 1,
            playerCode: PlayerCode.STAR,
            location: 0,
          ),
          currentLocation: 0,
          tokenId: tokenId);
    } else {
      tokenAction = TokenAction.Pass;
      if (currentLocation.currentPosition >= 0 &&
          (number + currentLocation.currentPosition) < 55) {
        updateCurrentLocationForRed(
          movesForRedPath[currentLocation.currentPosition + number],
          currentLocation: currentLocation.currentPosition + number,
          tokenId: tokenId,
        );
      } else if (number + currentLocation.currentPosition == 56) {
        print('home');
        tokenAction = TokenAction.BonusPoint;
        updateCurrentLocationForRed(
          movesForRedPath[currentLocation.currentPosition + number - 1],
          currentLocation: currentLocation.currentPosition + number - 1,
          playerCode: PlayerCode.REDHOME,
          tokenId: tokenId,
        );
      }
    }

    print('token action red to blue ${tokenAction}');
    switchUserTurn(number,
        playerCode: playingBoard == PlayingBoard.RED_YELLOW
            ? PlayerCode.YELLOW
            : PlayerCode.BLUE);
    // switchUserTurn(number, playerCode: PlayerCode.BLUE);

    notifyListeners();
  }

  void updateCurrentLocationForRed(MoveForRed move,
      {int currentLocation, int tokenId, PlayerCode playerCode}) {
    currentLocationRedToken[tokenId] = CurrentRedTravelingPath(
        index1: move.index1,
        index2: move.index2,
        playerCode: playerCode ?? move.playerCode,
        tokenId: tokenId,
        currentPosition: currentLocation);
    tokenKillingFromRedToken(
        index1: move.index1, index2: move.index2, playerCode: move.playerCode);
  }

  /// blue token killing logic
  void tokenKillingFromBlueToken({
    int index1,
    index2,
    PlayerCode playerCode,
    int tokenId,
  }) {
    removeYellowToken(index1: index1, index2: index2, playerCode: playerCode);
    removeGreenToken(index1: index1, index2: index2, playerCode: playerCode);
    removeRedToken(index1: index1, index2: index2, playerCode: playerCode);
  }

  /// yellow token killing logic
  void tokenKillingFromYellowToken({
    int index1,
    index2,
    PlayerCode playerCode,
    int tokenId,
  }) {
    removeGreenToken(index1: index1, index2: index2, playerCode: playerCode);
    removeBlueToken(index1: index1, index2: index2, playerCode: playerCode);
    removeRedToken(index1: index1, index2: index2, playerCode: playerCode);
  }

  /// green token killing logic
  void tokenKillingFromGreenToken({
    int index1,
    index2,
    PlayerCode playerCode,
    int tokenId,
  }) {
    removeYellowToken(index1: index1, index2: index2, playerCode: playerCode);
    removeBlueToken(index1: index1, index2: index2, playerCode: playerCode);
    removeRedToken(index1: index1, index2: index2, playerCode: playerCode);
  }

  /// red token killing logic

// yellow
  void tokenKillingFromRedToken({
    int index1,
    index2,
    PlayerCode playerCode,
    int tokenId,
  }) {
    removeBlueToken(index1: index1, index2: index2, playerCode: playerCode);
    removeGreenToken(index1: index1, index2: index2, playerCode: playerCode);
    removeYellowToken(index1: index1, index2: index2, playerCode: playerCode);
  }

  removeBlueToken({int index1, int index2, PlayerCode playerCode}) {
    currentLocationBlueToken.forEach((k, v) {
      if (v.index1 == index1 &&
          v.index2 == index2 &&
          v.playerCode == playerCode &&
          playerCode != PlayerCode.STAR) {
        isRollAgain = true;
        tokenAction = TokenAction.BonusPoint;
        print('true for blue $k');
        currentLocationBlueToken[k] = CurrentBlueTravelingPath(
          index1: -1,
          index2: -1,
          playerCode: PlayerCode.HOME,
        );
      }
    });
  }

  removeYellowToken({int index1, int index2, PlayerCode playerCode}) {
    currentLocationYellowToken.forEach((k, v) {
      if (v.index1 == index1 &&
          v.index2 == index2 &&
          v.playerCode == playerCode &&
          playerCode != PlayerCode.STAR) {
        print('trur for yellow $k');
        tokenAction = TokenAction.BonusPoint;
        isRollAgain = true;
        currentLocationYellowToken[k] = CurrentYellowTravelingPath(
          index1: -1,
          index2: -1,
          playerCode: PlayerCode.HOME,
        );
      }
    });
  }

  removeGreenToken({int index1, int index2, PlayerCode playerCode}) {
    currentLocationGreenToken.forEach((k, v) {
      if (v.index1 == index1 &&
          v.index2 == index2 &&
          v.playerCode == playerCode &&
          playerCode != PlayerCode.STAR) {
        tokenAction = TokenAction.BonusPoint;
        isRollAgain = true;
        print('trur for green $k');
        currentLocationGreenToken[k] = CurrentGreenTravelingPath(
          index1: -1,
          index2: -1,
          playerCode: PlayerCode.HOME,
        );
      }
    });
  }

  removeRedToken({int index1, int index2, PlayerCode playerCode}) {
    currentLocationRedToken.forEach((k, v) {
      if (v.index1 == index1 &&
          v.index2 == index2 &&
          v.playerCode == playerCode &&
          playerCode != PlayerCode.STAR) {
        print('true for yellow $k');
        tokenAction = TokenAction.BonusPoint;
        isRollAgain = true;
        currentLocationRedToken[k] = CurrentRedTravelingPath(
          index1: -1,
          index2: -1,
          playerCode: PlayerCode.HOME,
        );
      }
    });
  }
}

enum TokenAction { BonusPoint, SpecialHome, Pass }
