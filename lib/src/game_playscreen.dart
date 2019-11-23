import 'package:flutter/material.dart';
import 'package:ludo_game/src/playerBoard/player.green.dart';
import 'package:ludo_game/src/playerBoard/player_blue.dart';
import 'package:ludo_game/src/playerBoard/player_red.dart';
import 'package:ludo_game/src/playerBoard/player_yellow.dart';
import 'package:ludo_game/src/state/state_model.dart';
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
            // decoration: BoxDecoration(color: Colors.blue),
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
                    CircleAvatar(
                      maxRadius: 30,
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
                    CircleAvatar(
                      maxRadius: 30,
                    ),
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
                        Expanded(
                            flex: 2,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                TriangleBox(),
                                // ClipRect(
                                //   clipper: _CustomClip(),
                                //   child: Container(),
                                // )
                              ],
                            )),
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
                    CircleAvatar(
                      maxRadius: 30,
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
                    Stack(
                      children: <Widget>[
                        DiceAnimaton(
                          animation: new GifController(
                              vsync: this,
                              animationBehavior: AnimationBehavior.normal,
                              duration: Duration(seconds: 1)),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      maxRadius: 30,
                    ),
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

class _DiceAnimatonState extends State<DiceAnimaton>
    with TickerProviderStateMixin {
  GifController gifController;
  Animation<double> _animation;
  AnimationController _animationController;
  Map<double, int> _diceNumber = {
    1.0: 1,
    2: 2,
    4.0: 4,
    7.0: 6,
    8.0: 8,
    10.0: 10
  };
  final testList = [1, 2, 3, 4, 5, 6];
  @override
  void initState() {
    gifController = widget.animation;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 1, end: 2).animate(_animationController);
    _animationController.addStatusListener((s) {
      if (s == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    gifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<StateModel>(context);
    // print(model.currentLocationBlueToken[0].index1);
    return ScaleTransition(
      scale: _animation,
      child: Padding(
        padding: const EdgeInsets.only(left: 8,right: 8),
        child: InkWell(
          // splashColor: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          onTap: () async {
            _animationController.forward();
            testList.shuffle();
            print(testList[0]);
            gifController.repeat(
                min: 1, max: 6, period: Duration(milliseconds: 250));
            await Future.delayed(Duration(seconds: 1), () {
              model.diceNumber = testList[0];
              gifController.animateTo(testList[0].toDouble(),
                  curve: Curves.ease, duration: Duration(seconds: 0));
            });
          },
          child: GifImage(
            image: AssetImage('assets/dice_play.gif'),
            controller: gifController,
          ),
        ),
      ),
    );
  }
}

class _CustomClip extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    // return ;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
