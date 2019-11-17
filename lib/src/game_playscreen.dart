import 'package:flutter/material.dart';
import 'package:ludo_game/src/playerBoard/player.green.dart';
import 'package:ludo_game/src/playerBoard/player_blue.dart';
import 'package:ludo_game/src/playerBoard/player_red.dart';
import 'package:ludo_game/src/playerBoard/player_yellow.dart';
import 'package:ludo_game/src/travelingBox/blue_traveling.dart';
import 'package:ludo_game/src/travelingBox/green.dart';
import 'package:ludo_game/src/travelingBox/red_traveling.dart';
import 'package:ludo_game/src/travelingBox/yellow.dart';
import 'package:ludo_game/src/triangle_box.dart';

class GamePlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff17105D),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black45, width: 1),
            color: Colors.grey[100],
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 4,
                          child: RedPlayer(
                            colorCode: Colors.red,
                          )),
                      Expanded(flex: 2, child: BlueTraveling()),
                      Expanded(
                          flex: 4,
                          child: BluePlayer(
                            colorCode: Colors.blue,
                          )),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 4, child: RedTraveling()),
                      Expanded(flex: 2, child: TriangleBox()),
                      Expanded(flex: 4, child: YellowTraveling()),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 4,
                          child: GreenPlayer(boardColor: Colors.green)),
                      Expanded(flex: 2, child: GreenTraveling()),
                      Expanded(
                          flex: 4,
                          child: YellowPlayer(
                            colorCode: Colors.yellow,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
