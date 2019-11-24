import 'package:ludo_game/utils/util.dart';

class MoveForBlue {
  int index1;
  int index2;
  PlayerCode playerCode;
  int location;
  final bool isSpecialPosition;
  MoveForBlue({
    this.index1,
    this.index2,
    this.isSpecialPosition = false,
    this.location = 0,
    this.playerCode = PlayerCode.BLUE,
  });
}

List<MoveForBlue> movesForBluePath = [
  MoveForBlue(
      index1: 1,
      index2: 2,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
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
  MoveForBlue(
      index1: 0,
      index2: 3,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForBlue(index1: 0, index2: 4, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 0, index2: 5, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 1, index2: 5, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 2, index2: 5, playerCode: PlayerCode.YELLOW),
  MoveForBlue(
      index1: 2,
      index2: 4,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForBlue(index1: 2, index2: 3, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 2, index2: 2, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 2, index2: 1, playerCode: PlayerCode.YELLOW),
  MoveForBlue(index1: 2, index2: 0, playerCode: PlayerCode.YELLOW),

// green path
  MoveForBlue(index1: 0, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 1, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 2, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForBlue(
      index1: 3,
      index2: 2,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForBlue(index1: 4, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 5, index2: 2, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 5, index2: 1, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 5, index2: 0, playerCode: PlayerCode.GREEN),
  MoveForBlue(
      index1: 4,
      index2: 0,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForBlue(index1: 3, index2: 0, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 2, index2: 0, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 1, index2: 0, playerCode: PlayerCode.GREEN),
  MoveForBlue(index1: 0, index2: 0, playerCode: PlayerCode.GREEN),

  // red path
  MoveForBlue(index1: 2, index2: 5, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 2, index2: 4, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 2, index2: 3, playerCode: PlayerCode.RED),
  MoveForBlue(
      index1: 2,
      index2: 2,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForBlue(index1: 2, index2: 1, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 2, index2: 0, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 1, index2: 0, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 0, index2: 0, playerCode: PlayerCode.RED),
  MoveForBlue(
      index1: 0,
      index2: 1,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),

  MoveForBlue(index1: 0, index2: 2, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 0, index2: 3, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 0, index2: 4, playerCode: PlayerCode.RED),
  MoveForBlue(index1: 0, index2: 5, playerCode: PlayerCode.RED),

  // blue path
  MoveForBlue(index1: 5, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForBlue(index1: 4, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForBlue(index1: 3, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForBlue(
      index1: 2,
      index2: 0,
      playerCode: PlayerCode.STAR,
      isSpecialPosition: true),
  MoveForBlue(index1: 1, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForBlue(index1: 0, index2: 0, playerCode: PlayerCode.BLUE),
  MoveForBlue(index1: 0, index2: 1, playerCode: PlayerCode.BLUE),
  MoveForBlue(
      index1: 1,
      index2: 1,
      playerCode: PlayerCode.BLUE,
      isSpecialPosition: true),
  MoveForBlue(
      index1: 2,
      index2: 1,
      playerCode: PlayerCode.BLUE,
      isSpecialPosition: true),
  MoveForBlue(
      index1: 3,
      index2: 1,
      playerCode: PlayerCode.BLUE,
      isSpecialPosition: true),
  MoveForBlue(
      index1: 4,
      index2: 1,
      playerCode: PlayerCode.BLUE,
      isSpecialPosition: true),
  MoveForBlue(
      index1: 5,
      index2: 1,
      playerCode: PlayerCode.BLUE,
      isSpecialPosition: true),
];
