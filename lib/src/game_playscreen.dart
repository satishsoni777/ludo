import 'package:flutter/material.dart';
import 'package:ludo_game/src/playerBoard/player.green.dart';
import 'package:ludo_game/src/playerBoard/player_blue.dart';
import 'package:ludo_game/src/playerBoard/player_red.dart';
import 'package:ludo_game/src/playerBoard/player_yellow.dart';
import 'package:ludo_game/src/state/models/state_model.dart';
import 'package:ludo_game/src/travelingBox/blue_traveling.dart';
import 'package:ludo_game/src/travelingBox/green.dart';
import 'package:ludo_game/src/travelingBox/red_traveling.dart';
import 'package:ludo_game/src/travelingBox/yellow.dart';
import 'package:ludo_game/src/triangle_box.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:scoped_model/scoped_model.dart';

class GamePlayScreen extends StatefulWidget {
  @override
  _GamePlayScreenState createState() => _GamePlayScreenState();
}

class _GamePlayScreenState extends State<GamePlayScreen>
    with TickerProviderStateMixin {
  List<bool> _diceAnimation = [];
  @override
  initState() {
    for (int i = 0; i < 4; i++) {
      _diceAnimation.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff17105D),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 60,
            decoration: BoxDecoration(color: Colors.blue),
            child: Row(
              children: <Widget>[],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(),
                    SizedBox(
                      width: 20,
                    ),
                    DiceAnimaton(
                      animation: new GifController(
                          vsync: this,
                          animationBehavior: AnimationBehavior.normal,
                          duration: Duration(seconds: 1)),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    DiceAnimaton(
                      animation: new GifController(
                          vsync: this,
                          animationBehavior: AnimationBehavior.normal,
                          duration: Duration(seconds: 1)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
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
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(),
                    SizedBox(
                      width: 20,
                    ),
                    DiceAnimaton(
                      animation: new GifController(
                          vsync: this,
                          value: 10,
                          animationBehavior: AnimationBehavior.normal,
                          duration: Duration(seconds: 1)),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    DiceAnimaton(
                      animation: new GifController(
                          vsync: this,
                          animationBehavior: AnimationBehavior.normal,
                          duration: Duration(seconds: 1)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DiceAnimaton extends StatefulWidget {
  final GifController animation;
  DiceAnimaton({this.animation});
  @override
  _DiceAnimatonState createState() => _DiceAnimatonState();
}

class _DiceAnimatonState extends State<DiceAnimaton> {
  GifController gifController;
  Map<double, int> _diceNumber = {
    1.0: 1,
    2: 2,
    4.0: 4,
    7.0: 6,
    8.0: 8,
    10.0: 10
  };
  @override
  void initState() {
    gifController = widget.animation;
    super.initState();
  }

  @override
  void dispose() {
    gifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final list = _diceNumber.keys.toList();
        list.shuffle();
        print(list);
        gifController.repeat(
            min: 1, max: 6, period: Duration(milliseconds: 250));
        await Future.delayed(Duration(seconds: 1), () {
          gifController.animateTo(list[0],
              curve: Curves.ease, duration: Duration(seconds: 0));
        });
      },
      child: GifImage(
        image: AssetImage('assets/dice_play.gif'),
        controller: gifController,
      ),
    );
  }
}
