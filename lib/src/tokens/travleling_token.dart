import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:ludo_game/src/state/state_model.dart';
import 'package:ludo_game/src/tokens/blue.dart';
import 'package:ludo_game/src/tokens/green.dart';
import 'package:ludo_game/src/tokens/red.dart';
import 'package:ludo_game/src/tokens/yellow.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

Widget moveToken(BuildContext context,
    {int index1,
    int index2,
    PlayerCode playerCode,
    double height,
    double width}) {
  final commonModel = ScopedModel.of<StateModel>(context);
  double height = 8;
  double width = 8;
  int token;
  final tokensChildren = <Widget>[];
  final blueTokenChildren = <Widget>[];
  final yellowTokenChildren = <Widget>[];
  final greenTokenChildren = <Widget>[];
  final redTokenChildren = <Widget>[];
  CurrentBlueTravelingPath currentBlueTravelingPath;
  CurrentYellowTravelingPath currentYellowTravleingPath;
  CurrentGreenTravelingPath currentGreenTravelingPath;
  CurrentRedTravelingPath currentRedTravelingPath;
  int count = 0;
  // print('token turns ${commonModel.playerTurn}');
  // logic for blue
  for (CurrentBlueTravelingPath b
      in commonModel.currentLocationBlueToken.values) {
    if ((b.playerCode == playerCode) &&
        (b.index1 == index1) &&
        (b.index2 == index2)) {
      count++;
      token = b.tokenId;
      currentBlueTravelingPath = b;
      blueTokenChildren.add(BlueToken(
        tokenId: b.tokenId,
        blueTravelingPath: b,
        height: 50,
        width: 50,
      ));
    }
  }
  count = 0;
  // logic for yellow
  for (CurrentYellowTravelingPath y
      in commonModel.currentLocationYellowToken.values) {
    if ((y.playerCode == playerCode) &&
        (y.index1 == index1) &&
        (y.index2 == index2)) {
      token = y.tokenId;
      currentYellowTravleingPath = y;
      count++;
      yellowTokenChildren.add(YellowToken(
        tokenId: y.tokenId,
        yellowTravelingPath: y,
        height: 50,
        width: 50,
      ));
    }
  }
  count = 0;
  // logic for green
  for (CurrentGreenTravelingPath g
      in commonModel.currentLocationGreenToken.values) {
    if ((g.playerCode == playerCode) &&
        (g.index1 == index1) &&
        (g.index2 == index2)) {
      token = g.tokenId;
      currentGreenTravelingPath = g;
      greenTokenChildren.add(GreenToken(
        tokenId: g.tokenId,
        greenTravelingPath: g,
        height: 50,
        width: 50,
      ));
    }
  }

// logic red
  for (CurrentRedTravelingPath r
      in commonModel.currentLocationRedToken.values) {
    if ((r.playerCode == playerCode) &&
        (r.index1 == index1) &&
        (r.index2 == index2)) {
      token = r.tokenId;
      currentRedTravelingPath = r;
      count++;
      redTokenChildren.add(RedToken(
        tokenId: r.tokenId,
        redTravelingPath: r,
        height: 50,
        width: 50,
      ));
    }
  }
  tokensChildren.addAll(blueTokenChildren);

  tokensChildren.addAll(greenTokenChildren);

  tokensChildren.addAll(yellowTokenChildren);

  tokensChildren.addAll(redTokenChildren);
  Queue<Widget> children = Queue();
  if (commonModel.playerTurn == PlayerCode.BLUE) {
    print('player code');
    tokensChildren.forEach((s) {
      if (s is BlueToken) {
        children.addLast(s);
      } else {
        children.addFirst(s);
      }
    });
  } else if (commonModel.playerTurn == PlayerCode.YELLOW) {
    tokensChildren.forEach((s) {
      if (s is YellowToken) {
        children.addLast(s);
      } else {
        children.addFirst(s);
      }
    });
  } else if (commonModel.playerTurn == PlayerCode.GREEN) {
    tokensChildren.forEach((s) {
      if (s is GreenToken) {
        children.addLast(s);
      } else {
        children.addFirst(s);
      }
    });
  } else if (commonModel.playerTurn == PlayerCode.RED) {
    tokensChildren.forEach((s) {
      if (s is RedToken) {
        children.addLast(s);
      } else {
        children.addFirst(s);
      }
    });
  }
  final tokens = children.toList();
  return Stack(children: tokens);
  // }
  // blue tokens widget
  // else if (blueTokenChildren.length == 1)
  //   return BlueToken(
  //     height: 50,
  //     width: 50,
  //     tokenId: token,
  //     blueTravelingPath: currentBlueTravelingPath,
  //   );

  // yellow token

  // else if (yellowTokenChildren.length == 1)
  //   return YellowToken(
  //     height: 50,
  //     width: 50,
  //     tokenId: token,
  //     yellowTravelingPath: currentYellowTravleingPath,
  //   );

  // green tokens
  // else if (greenTokenChildren.length == 1)
  //   return GreenToken(
  //     height: 50,
  //     width: 50,
  //     tokenId: token,
  //     greenTravelingPath: currentGreenTravelingPath,
  //   );

  // red widget token
  // else if (redTokenChildren.length == 1) {
  //   return RedToken(
  //     height: 50,
  //     width: 50,
  //     tokenId: token,
  //     redTravelingPath: currentRedTravelingPath,
  //   );
  // }
  // else
  // return Container();
}
