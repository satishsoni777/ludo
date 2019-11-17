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
// import 'package:gif_ani/gif_ani.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';

class GamePlayScreen extends StatefulWidget {
  @override
  _GamePlayScreenState createState() => _GamePlayScreenState();
}

class _GamePlayScreenState extends State<GamePlayScreen>
    with SingleTickerProviderStateMixin {
  GifController _animationCtrl;
  GifController _animationCtrl1;
  GifController _animationCtrl2;
  GifController _animationCtrl3;
  @override
  void initState() {
    _animationCtrl = new GifController(
      vsync: this,
      duration: new Duration(milliseconds: 2000),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationCtrl.dispose();
    super.dispose();
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
            color: Colors.red,
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
                    InkWell(
                      onTap: () async {
                        setState(() {
                          _animationCtrl.repeat(
                              min: 0,
                              max: 11,
                              period: Duration(milliseconds: 400));
                        });

                        await Future.delayed(Duration(seconds: 1), () {
                          //  _animationCtrl.stop();
                          print('adsd');
                          print(_animationCtrl.duration);
                          _animationCtrl.animateTo(6,
                              curve: Curves.ease,
                              duration: Duration(seconds: 0));
                        });
                      },
                      child: GifImage(
                        image: AssetImage('assets/dice_play.gif'),
                        controller: _animationCtrl,
                      ),
                    ),
                    // Image.asset(
                    //   'assets/dice_play.gif',
                    //   width: 50,
                    // ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () async {
                        setState(() {
                          _animationCtrl.repeat(
                              min: 0,
                              max: 11,
                              period: Duration(milliseconds: 400));
                        });

                        await Future.delayed(Duration(seconds: 1), () {
                          //  _animationCtrl.stop();
                          _animationCtrl.animateTo(6,
                              curve: Curves.ease,
                              duration: Duration(seconds: 0));
                        });
                      },
                      child: GifImage(
                        image: AssetImage('assets/dice_play.gif'),
                        controller: _animationCtrl,
                      ),
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
            color: Colors.red,
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
                    InkWell(
                      onTap: () async {
                        setState(() {
                          _animationCtrl.repeat(
                              min: 0,
                              max: 6,
                              period: Duration(milliseconds: 400));
                        });

                        await Future.delayed(Duration(seconds: 1), () {
                          //  _animationCtrl.stop();
                          _animationCtrl.animateTo(6,
                              curve: Curves.ease,
                              duration: Duration(seconds: 0));
                        });
                      },
                      child: GifImage(
                        image: AssetImage('assets/dice_play.gif'),
                        controller: _animationCtrl,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () async {
                        setState(() {
                          _animationCtrl.repeat(
                              min: 0,
                              max: 11,
                              period: Duration(milliseconds: 400));
                        });

                        await Future.delayed(Duration(seconds: 1), () {
                          //  _animationCtrl.stop();
                          _animationCtrl.animateTo(6,
                              curve: Curves.ease,
                              duration: Duration(seconds: 0));
                        });
                      },
                      child: GifImage(
                        image: AssetImage('assets/dice_play.gif'),
                        controller: _animationCtrl,
                      ),
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
class DiceAnimaton extends StatefulWidget{
  @override
  _DiceAnimatonState createState() => _DiceAnimatonState();
}

class _DiceAnimatonState extends State<DiceAnimaton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
