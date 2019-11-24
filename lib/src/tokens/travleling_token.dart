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
  // print(playerCode);
  int token;
  final blueTokenChildren = <Widget>[];
  final yellowTokenChildren = <Widget>[];
  final greenTokenChildren = <Widget>[];
  final redTokenChildren = <Widget>[];
  CurrentBlueTravelingPath currentBlueTravelingPath;
  CurrentYellowTravelingPath currentYellowTravleingPath;
  CurrentGreenTravelingPath currentGreenTravelingPath;
  CurrentRedTravelingPath currentRedTravelingPath;
  
  // logic for blue
  for (CurrentBlueTravelingPath b
      in commonModel.currentLocationBlueToken.values) {
    if ((b.playerCode == playerCode) &&
        (b.index1 == index1) &&
        (b.index2 == index2)) {
      token = b.tokenId;
      currentBlueTravelingPath = b;

      blueTokenChildren.add(BlueToken(
        tokenId: b.tokenId,
        blueTravelingPath: b,
      ));
    }
  }

  // logic for yellow
  for (CurrentYellowTravelingPath y
      in commonModel.currentLocationYellowToken.values) {
    if ((y.playerCode == playerCode) &&
        (y.index1 == index1) &&
        (y.index2 == index2)) {
      token = y.tokenId;
      currentYellowTravleingPath = y;
      yellowTokenChildren.add(YellowToken(
        tokenId: y.tokenId,
        yellowTravelingPath: y,
      ));
    }
  }

  // logic for green
  for (CurrentGreenTravelingPath g
      in commonModel.currentLocationGreenToken.values) {
    if ((g.playerCode == playerCode) &&
        (g.index1 == index1) &&
        (g.index2 == index2)) {
      print('gren token painted');
      token = g.tokenId;
      currentGreenTravelingPath = g;
      greenTokenChildren.add(GreenToken(
        tokenId: g.tokenId,
        greenTravelingPath: g,
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
      redTokenChildren.add(RedToken(
        tokenId: r.tokenId,
        redTravelingPath: r,
      ));
    }
  }

  // blue tokens widget
  if (blueTokenChildren.isNotEmpty) {
    if (blueTokenChildren.length == 1)
      return BlueToken(
        height: 50,
        width: 50,
        tokenId: token,
        blueTravelingPath: currentBlueTravelingPath,
      );
    else if (blueTokenChildren.length >= 2)
      return Wrap(alignment: WrapAlignment.center, children: blueTokenChildren);
    else
      return BlueToken(
        height: 50,
        width: 50,
        tokenId: token,
        blueTravelingPath: currentBlueTravelingPath,
      );
  }

  // yellow token
  else if (yellowTokenChildren.isNotEmpty) {
    if (yellowTokenChildren.length == 1)
      return YellowToken(
        height: 50,
        width: 50,
        tokenId: token,
        yellowTravelingPath: currentYellowTravleingPath,
      );
    else if (yellowTokenChildren.length >= 2)
      return Wrap(alignment: WrapAlignment.center, children: yellowTokenChildren);
    else
      return YellowToken(
        height: 50,
        width: 50,
        tokenId: token,
        yellowTravelingPath: currentYellowTravleingPath,
      );
  }
  
  // green tokens
   else if (greenTokenChildren.isNotEmpty) {
    if (greenTokenChildren.length == 1)
      return GreenToken(
        height: 50,
        width: 50,
        tokenId: token,
        greenTravelingPath: currentGreenTravelingPath,
      );
    else if (greenTokenChildren.length >= 2)
      return Wrap(
          alignment: WrapAlignment.center, children: greenTokenChildren);
    else
      return GreenToken(
        height: 50,
        width: 50,
        tokenId: token,
        greenTravelingPath: currentGreenTravelingPath,
      );
  } 

  // red widget token
  else if (redTokenChildren.isNotEmpty) {
    if (redTokenChildren.length == 1)
      return RedToken(
        height: 50,
        width: 50,
        tokenId: token,
        redTravelingPath: currentRedTravelingPath,
      );
    else if (greenTokenChildren.length >= 2)
      return Wrap(alignment: WrapAlignment.center, children: redTokenChildren);
    else
      return RedToken(
        height: 50,
        width: 50,
        tokenId: token,
        redTravelingPath: currentRedTravelingPath,
      );
  } else
    return Container();
}
