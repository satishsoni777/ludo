import 'package:ludo_game/src/state/state_model.dart';
import 'package:ludo_game/utils/util.dart';

class RemoveTokenLogic extends StateModel {
  RemoveTokenLogic.removeBlueToken(
      {int index1, int index2, PlayerCode playerCode}) {
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
    });notifyListeners();
  }

  RemoveTokenLogic.removeYellowToken(
      {int index1, int index2, PlayerCode playerCode}) {
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
    notifyListeners();
  }

  RemoveTokenLogic.removeGreenToken(
      {int index1, int index2, PlayerCode playerCode}) {
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
    });notifyListeners();
  }

  RemoveTokenLogic.removeRedToken(
      {int index1, int index2, PlayerCode playerCode}) {
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
    });notifyListeners();
  }
}
