import 'package:ludo_game/utils/util.dart';

class BlueTravelingPath {
  int index1;
  int index2;
  PlayerCode playerCode;
  int currentPosition;
  BlueTravelingPath(
      {this.index1 = -1,
      this.index2 = -1,
      this.currentPosition = -1,
      this.playerCode = PlayerCode.BLUE});
}

class YellowTravelingPath {
  int index1;
  int index2;
  PlayerCode playerCode;
  int numberOfTokens;
  YellowTravelingPath(
      {this.numberOfTokens = 1,
      this.index1,
      this.index2,
      this.playerCode = PlayerCode.YELLOW});
}

class GreenTravelingPath {
  int index1;
  int index2;
  PlayerCode playerCode;
  GreenTravelingPath(
      {this.index1, this.index2, this.playerCode = PlayerCode.GREEN});
}

class RedTravelingPath {
  int index1;
  int index2;
  PlayerCode playerCode;
  RedTravelingPath(
      {this.index1, this.index2, this.playerCode = PlayerCode.RED});
}
