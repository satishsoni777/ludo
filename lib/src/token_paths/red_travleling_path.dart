import 'package:ludo_game/utils/util.dart';

class MoveForRed {
  int index1;
  int index2;
  PlayerCode playerCode;
  int location;
  bool isSpecialPosition;
  MoveForRed({
    this.index1,
    this.index2,
    this.isSpecialPosition = false,
    this.location = 0,
    this.playerCode = PlayerCode.RED,
  });
}

List<MoveForRed> movesForRedPath = [
  MoveForRed(
      index1: 0,
      index2: 1,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForRed(
    index1: 0,
    index2: 2,
  ),
  MoveForRed(
    index1: 0,
    index2: 3,
  ),
  MoveForRed(
    index1: 0,
    index2: 4,
  ),
  MoveForRed(
    index1: 0,
    index2: 5,
  ),

  // blue path
  MoveForRed(index1: 5, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForRed(index1: 4, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForRed(index1: 3, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForRed(
      index1: 2,
      index2: 0,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForRed(index1: 1, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForRed(index1: 0, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForRed(index1: 0, index2: 1, playerCode: PlayerCode.BLUE),
  MoveForRed(index1: 0, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForRed(
      index1: 1,
      index2: 2,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForRed(index1: 2, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForRed(index1: 3, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForRed(index1: 4, index2: 2, playerCode: PlayerCode.BLUE),
  MoveForRed(index1: 5, index2: 2, playerCode: PlayerCode.BLUE),

// yellow path
  MoveForRed(index1: 0, index2: 0, playerCode: PlayerCode.YELLOW),
  MoveForRed(index1: 0, index2: 1, playerCode: PlayerCode.YELLOW),
  MoveForRed(index1: 0, index2: 2, playerCode: PlayerCode.YELLOW),
  MoveForRed(
      index1: 0,
      index2: 3,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForRed(index1: 0, index2: 4, playerCode: PlayerCode.YELLOW),
  MoveForRed(index1: 0, index2: 5, playerCode: PlayerCode.YELLOW),
  MoveForRed(index1: 1, index2: 5, playerCode: PlayerCode.YELLOW),
  MoveForRed(index1: 2, index2: 5, playerCode: PlayerCode.YELLOW),
  MoveForRed(
      index1: 2,
      index2: 4,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForRed(index1: 2, index2: 3, playerCode: PlayerCode.YELLOW),
  MoveForRed(index1: 2, index2: 2, playerCode: PlayerCode.YELLOW),
  MoveForRed(index1: 2, index2: 1, playerCode: PlayerCode.YELLOW),
  MoveForRed(index1: 2, index2: 0, playerCode: PlayerCode.YELLOW),

// green path
  MoveForRed(index1: 0, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForRed(index1: 1, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForRed(index1: 2, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForRed(
      index1: 3,
      index2: 2,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForRed(index1: 4, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForRed(index1: 5, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForRed(index1: 5, index2: 1, playerCode: PlayerCode.GREEN),
  MoveForRed(index1: 5, index2: 0, playerCode: PlayerCode.GREEN),
  MoveForRed(
      index1: 4,
      index2: 0,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForRed(index1: 3, index2: 0, playerCode: PlayerCode.GREEN),
  MoveForRed(index1: 2, index2: 0, playerCode: PlayerCode.GREEN),
  MoveForRed(index1: 1, index2: 0, playerCode: PlayerCode.GREEN),
  MoveForRed(index1: 0, index2: 0, playerCode: PlayerCode.GREEN),

  // red path
  MoveForRed(index1: 2, index2: 5, playerCode: PlayerCode.RED),
  MoveForRed(index1: 2, index2: 4, playerCode: PlayerCode.RED),
  MoveForRed(index1: 2, index2: 3, playerCode: PlayerCode.RED),
  MoveForRed(
      index1: 2,
      index2: 2,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForRed(index1: 2, index2: 1, playerCode: PlayerCode.RED),
  MoveForRed(index1: 2, index2: 0, playerCode: PlayerCode.RED),
  MoveForRed(index1: 1, index2: 0, playerCode: PlayerCode.RED),

  MoveForRed(
      index1: 1,
      index2: 1,
      playerCode: PlayerCode.RED,
      isSpecialPosition: true),
  MoveForRed(
      index1: 1,
      index2: 2,
      playerCode: PlayerCode.RED,
      isSpecialPosition: true),
  MoveForRed(
      index1: 1,
      index2: 3,
      playerCode: PlayerCode.RED,
      isSpecialPosition: true),
  MoveForRed(
      index1: 1,
      index2: 4,
      playerCode: PlayerCode.RED,
      isSpecialPosition: true),
  MoveForRed(
      index1: 1,
      index2: 5,
      playerCode: PlayerCode.RED,
      isSpecialPosition: true),
];
