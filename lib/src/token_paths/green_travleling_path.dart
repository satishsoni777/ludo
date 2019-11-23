import 'package:ludo_game/utils/util.dart';

class MoveForGreen {
  int index1;
  int index2;
  PlayerCode playerCode;
  int location;
  List<Map<PlayerCode, int>> specialPosition = [];
  MoveForGreen({
    this.index1,
    this.index2,
    this.specialPosition,
    this.location = 0,
    this.playerCode = PlayerCode.GREEN,
  });
}

List<MoveForGreen> movesForGreenPath = [
  MoveForGreen(
      index1: 4,
      index2: 0,
      playerCode: PlayerCode.GREENSTAR,
      specialPosition: [
        {PlayerCode.BLUE: 0}
      ]),
  MoveForGreen(
    index1: 3,
    index2: 0,
  ),
  MoveForGreen(
    index1: 2,
    index2: 0,
  ),
  MoveForGreen(
    index1: 1,
    index2: 0,
  ),
  MoveForGreen(
    index1: 0,
    index2: 0,
  ),
// red path
  MoveForGreen(index1: 2, index2: 5, playerCode: PlayerCode.RED),
  MoveForGreen(index1: 2, index2: 4, playerCode: PlayerCode.RED),
  MoveForGreen(index1: 2, index2: 3, playerCode: PlayerCode.RED),
  MoveForGreen(
      index1: 2,
      index2: 2,
      playerCode: PlayerCode.RED,
      specialPosition: [
        {PlayerCode.BLUE: 0}
      ]),
  MoveForGreen(index1: 2, index2: 1, playerCode: PlayerCode.RED),
  MoveForGreen(index1: 2, index2: 0, playerCode: PlayerCode.RED),
  MoveForGreen(index1: 1, index2: 0, playerCode: PlayerCode.RED),
  MoveForGreen(index1: 0, index2: 0, playerCode: PlayerCode.RED),
  MoveForGreen(
      index1: 0,
      index2: 1,
      playerCode: PlayerCode.RED,
      specialPosition: [
        {PlayerCode.BLUE: 0}
      ]),

  MoveForGreen(index1: 0, index2: 2, playerCode: PlayerCode.RED),
  MoveForGreen(index1: 0, index2: 3, playerCode: PlayerCode.RED),
  MoveForGreen(index1: 0, index2: 4, playerCode: PlayerCode.RED),
  MoveForGreen(index1: 0, index2: 5, playerCode: PlayerCode.RED),

  // blue path
  MoveForGreen(index1: 5, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForGreen(index1: 4, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForGreen(index1: 3, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForGreen(index1: 2, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForGreen(index1: 1, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForGreen(index1: 0, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForGreen(index1: 0, index2: 1, playerCode: PlayerCode.BLUE),
  MoveForGreen(index1: 0, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForGreen(index1: 1, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForGreen(index1: 2, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForGreen(index1: 3, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForGreen(index1: 4, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForGreen(index1: 5, index2: 2, playerCode: PlayerCode.BLUE),

  // yellow path
  MoveForGreen(index1: 0, index2: 0, playerCode: PlayerCode.YELLOW),
  MoveForGreen(index1: 0, index2: 1, playerCode: PlayerCode.YELLOW),
  MoveForGreen(index1: 0, index2: 2, playerCode: PlayerCode.YELLOW),
  MoveForGreen(
      index1: 0,
      index2: 3,
      playerCode: PlayerCode.YELLOW,
      specialPosition: [
        {PlayerCode.BLUE: 0}
      ]),
  MoveForGreen(index1: 0, index2: 4, playerCode: PlayerCode.YELLOW),
  MoveForGreen(index1: 0, index2: 5, playerCode: PlayerCode.YELLOW),
  MoveForGreen(index1: 1, index2: 5, playerCode: PlayerCode.YELLOW),
  MoveForGreen(index1: 2, index2: 5, playerCode: PlayerCode.YELLOW),
  MoveForGreen(
      index1: 2,
      index2: 4,
      playerCode: PlayerCode.YELLOW,
      specialPosition: [
        {PlayerCode.BLUE: 0}
      ]),
  MoveForGreen(index1: 2, index2: 3, playerCode: PlayerCode.YELLOW),
  MoveForGreen(index1: 2, index2: 2, playerCode: PlayerCode.YELLOW),
  MoveForGreen(index1: 2, index2: 1, playerCode: PlayerCode.YELLOW),
  MoveForGreen(index1: 2, index2: 0, playerCode: PlayerCode.YELLOW),

// green path
  MoveForGreen(index1: 0, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForGreen(index1: 1, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForGreen(index1: 2, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForGreen(
      index1: 3,
      index2: 2,
      playerCode: PlayerCode.GREENSTAR,
      specialPosition: [
        {PlayerCode.BLUE: 0}
      ]),
  MoveForGreen(index1: 4, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForGreen(index1: 5, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForGreen(index1: 5, index2: 1, playerCode: PlayerCode.GREEN),
  MoveForGreen(index1: 4, index2: 1, playerCode: PlayerCode.GREEN),
  MoveForGreen(
      index1: 3,
      index2: 1,
      playerCode: PlayerCode.GREEN,
      specialPosition: [
        {PlayerCode.BLUE: 0}
      ]),
  MoveForGreen(index1: 2, index2: 1, playerCode: PlayerCode.GREEN),
  MoveForGreen(index1: 1, index2: 1, playerCode: PlayerCode.GREEN),
  MoveForGreen(index1: 0, index2: 1, playerCode: PlayerCode.GREEN),
];
