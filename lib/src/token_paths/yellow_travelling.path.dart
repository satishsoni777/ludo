import 'package:ludo_game/utils/util.dart';

class MoveForYellow {
  int index1;
  int index2;
  PlayerCode playerCode;
  int location;
  bool isSpecialPosition;
  MoveForYellow({
    this.index1,
    this.index2,
    this.isSpecialPosition = false,
    location,
    this.playerCode = PlayerCode.YELLOW,
  });
}

List<MoveForYellow> movesForYellowPath = [
  MoveForYellow(
      index1: 2,
      index2: 4,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForYellow(
    index1: 2,
    index2: 3,
  ),
  MoveForYellow(
    index1: 2,
    index2: 2,
  ),
  MoveForYellow(
    index1: 2,
    index2: 1,
  ),
  MoveForYellow(
    index1: 2,
    index2: 0,
  ),

// green path
  MoveForYellow(index1: 0, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForYellow(index1: 1, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForYellow(index1: 2, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForYellow(
      index1: 3,
      index2: 2,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForYellow(index1: 4, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForYellow(index1: 5, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForYellow(index1: 5, index2: 1, playerCode: PlayerCode.GREEN),
  MoveForYellow(index1: 5, index2: 0, playerCode: PlayerCode.GREEN),
  MoveForYellow(
      index1: 4,
      index2: 0,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForYellow(index1: 3, index2: 0, playerCode: PlayerCode.GREEN),
  MoveForYellow(index1: 2, index2: 0, playerCode: PlayerCode.GREEN),
  MoveForYellow(index1: 1, index2: 0, playerCode: PlayerCode.GREEN),
  MoveForYellow(index1: 0, index2: 0, playerCode: PlayerCode.GREEN),

  // red path
  MoveForYellow(index1: 2, index2: 5, playerCode: PlayerCode.RED),
  MoveForYellow(index1: 2, index2: 4, playerCode: PlayerCode.RED),
  MoveForYellow(index1: 2, index2: 3, playerCode: PlayerCode.RED),
  MoveForYellow(
      index1: 2,
      index2: 2,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForYellow(index1: 2, index2: 1, playerCode: PlayerCode.RED),
  MoveForYellow(index1: 2, index2: 0, playerCode: PlayerCode.RED),
  MoveForYellow(index1: 1, index2: 0, playerCode: PlayerCode.RED),
  MoveForYellow(index1: 0, index2: 0, playerCode: PlayerCode.RED),
  MoveForYellow(
      index1: 0,
      index2: 1,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),

  MoveForYellow(index1: 0, index2: 2, playerCode: PlayerCode.RED),
  MoveForYellow(index1: 0, index2: 3, playerCode: PlayerCode.RED),
  MoveForYellow(index1: 0, index2: 4, playerCode: PlayerCode.RED),
  MoveForYellow(index1: 0, index2: 5, playerCode: PlayerCode.RED),

  // blue path
  MoveForYellow(index1: 5, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForYellow(index1: 4, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForYellow(index1: 3, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForYellow(
      index1: 2,
      index2: 0,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForYellow(index1: 1, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForYellow(index1: 0, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForYellow(index1: 0, index2: 1, playerCode: PlayerCode.BLUE),
  MoveForYellow(index1: 0, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForYellow(
      index1: 1,
      index2: 2,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForYellow(index1: 2, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForYellow(index1: 3, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForYellow(index1: 4, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForYellow(index1: 5, index2: 2, playerCode: PlayerCode.BLUE),

  // yellow path
  MoveForYellow(index1: 0, index2: 0, playerCode: PlayerCode.YELLOW),
  MoveForYellow(index1: 0, index2: 1, playerCode: PlayerCode.YELLOW),
  MoveForYellow(index1: 0, index2: 2, playerCode: PlayerCode.YELLOW),
  MoveForYellow(
      index1: 0,
      index2: 3,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForYellow(index1: 0, index2: 4, playerCode: PlayerCode.YELLOW),
  MoveForYellow(index1: 0, index2: 5, playerCode: PlayerCode.YELLOW),
  MoveForYellow(index1: 1, index2: 5, playerCode: PlayerCode.YELLOW),
  MoveForYellow(
      index1: 1,
      index2: 4,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForYellow(
      index1: 1,
      index2: 3,
      playerCode: PlayerCode.YELLOW,
      isSpecialPosition: true),
  MoveForYellow(
      index1: 1,
      index2: 2,
      playerCode: PlayerCode.YELLOW,
      isSpecialPosition: true),
  MoveForYellow(
      index1: 1,
      index2: 1,
      playerCode: PlayerCode.YELLOW,
      isSpecialPosition: true),
  MoveForYellow(
      index1: 1,
      index2: 0,
      playerCode: PlayerCode.YELLOW,
      isSpecialPosition: true),
];
