import 'package:ludo_game/utils/util.dart';

class GameLogic {
  List<NodeLocation> nodeLocation=[];
  GameLogic() {
    // for blue
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 6; j++) {
        nodeLocation.add(
            NodeLocation(index1: i, index2: j, playerCode: PlayerCode.BLUE));
      }
    }
    // for yellow
    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 3; j++) {
        nodeLocation.add(
            NodeLocation(index1: i, index2: j, playerCode: PlayerCode.YELLOW));
      }
    }
    // for green
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 6; j++) {
        nodeLocation.add(
            NodeLocation(index1: i, index2: j, playerCode: PlayerCode.GREEN));
      }
    }
    // for red
    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 3; j++) {
        nodeLocation.add(
            NodeLocation(index1: i, index2: j, playerCode: PlayerCode.RED));
      }
    }
  }
}

class NodeLocation {
  PlayerCode playerCode;
  int index1;
  int index2;
  NodeLocation({this.index1, this.index2, this.playerCode});
}

abstract class GamePlayerLogic {}

class GreenPlayer extends GamePlayerLogic {}

class RedPlayer extends GamePlayerLogic {}

class YellowPlayer extends GamePlayerLogic {}

class BluePlayer extends GamePlayerLogic {}
