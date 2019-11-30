import 'dart:math';
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
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/cupertino.dart';

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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(30, 50.0),
        child: AppBar(
          elevation: .1,
          backgroundColor: Colors.white12,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios)),
          primary: true,
        ),
      ),
      backgroundColor: Color(0xff17105D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Container(
          //     height: 40,
          //     decoration: BoxDecoration(color: Colors.white38),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: <Widget>[
          //         IconButton(
          //           onPressed: (){
          //             Navigator.pop(context);
          //           },
          //           icon: Icon(Icons.arrow_back_ios),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
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
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 4,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        radius: 30,
                        // maxRadius: 30,
                        backgroundImage: AssetImage('assets/images/boy1.jpg'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DiceAnimaton(
                      playerCode: PlayerCode.RED,
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
                      playerCode: PlayerCode.BLUE,
                      animation: new GifController(
                          vsync: this,
                          animationBehavior: AnimationBehavior.normal,
                          duration: Duration(seconds: 1)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 4,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        radius: 30,
                        // maxRadius: 30,
                        backgroundImage: AssetImage('assets/images/boy1.jpg'),
                      ),
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
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                            width: 4,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        radius: 30,
                        // maxRadius: 30,
                        backgroundImage: AssetImage('assets/images/boy1.jpg'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DiceAnimaton(
                      playerCode: PlayerCode.GREEN,
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
                      playerCode: PlayerCode.YELLOW,
                      animation: new GifController(
                          vsync: this,
                          animationBehavior: AnimationBehavior.normal,
                          duration: Duration(seconds: 500)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.yellow,
                            width: 4,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        radius: 30,
                        // maxRadius: 30,
                        backgroundImage: AssetImage('assets/images/boy1.jpg'),
                      ),
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
  final PlayerCode playerCode;
  DiceAnimaton({this.animation, this.playerCode});
  @override
  _DiceAnimatonState createState() => _DiceAnimatonState();
}

class _DiceAnimatonState extends State<DiceAnimaton>
    with TickerProviderStateMixin {
  GifController gifController;
  Animation<double> _animation;
  AnimationController _animationController;
  Map<int, double> _diceNumber = {};
  final testList = [1, 2, 3, 4, 5, 6];
  int min = 1, max = 7;
  Random rnd;
  @override
  void initState() {
    rnd = new Random();
    gifController =
        GifController(vsync: this, duration: Duration(milliseconds: 600));
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 1, end: 2).animate(_animationController);
    _animationController.addStatusListener((s) {
      if (s == AnimationStatus.completed) {
        print('forw ${_animationController.isAnimating}');
        _animationController.reverse();

        setState(() {});
        print(_animationController.isAnimating);
      } else if (s == AnimationStatus.reverse) {
        setState(() {});
        print('rever ${_animationController.isAnimating}');
      }
    });
    gifController.addStatusListener((s) {
      if (s == AnimationStatus.completed) {
        print('forw ${_animationController.isAnimating}');
        gifController.reverse();

        setState(() {});
        print(_animationController.isAnimating);
      } else if (s == AnimationStatus.reverse) {
        setState(() {});
        print('rever ${_animationController.isAnimating}');
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    diceNum = 0;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    gifController.dispose();
    super.dispose();
  }

  int diceNum = 0;
  void _rolleDice(StateModel model) async {
    diceNum = min + rnd.nextInt(max - min);

    await Future.delayed(Duration(milliseconds: 600), () {
      _diceRolled = false;
      setState(() {});
    });
    await Future.delayed(Duration(milliseconds: 1000), () {
      model.diceNumber = diceNum;
      _moveTokes();
    });
  }

  int tokenId = 1;
  var locken;
  _moveTokes() {
    int insideHome = 0, outFromGame = 0,totalOut;
    if (model.playerTurn == PlayerCode.BLUE) {
      model.currentLocationBlueToken.forEach((k, v) {
        if (v.playerCode != PlayerCode.HOME) {
          insideHome++;
        } else if (v.playerCode == PlayerCode.BLUEHOME) {
          outFromGame++;
        }
      });
      if (insideHome-outFromGame == 0 || insideHome-outFromGame  == 1) {
        if (insideHome == 0) {
          tokenId = 1;
        } else if (insideHome == 1) {}
        print('all inside  ${_animationController.status}');
        // _blueToken();
      }
      // if (insideHome == 4) _blueToken();
      insideHome = 0;
    } else if (model.playerTurn == PlayerCode.HOME) {
      model.currentLocationBlueToken.forEach((k, v) {
        if (v.playerCode != PlayerCode.HOME) {
          insideHome++;
        } else {}
      });
      if (insideHome == 0) {
        print('all inside  ${_animationController.status}');
        _yellowToken();
      }
    } else if (model.playerTurn == PlayerCode.GREEN) {
      _greenToken();
    } else if (model.playerTurn == PlayerCode.RED) {
      _redToken();
    }
  }

  void _blueToken() {
    model.moveForBlue(model.diceNumber,
        blueTokenId: tokenId,
        currentLocation: CurrentBlueTravelingPath(
            tokenId: tokenId, playerCode: PlayerCode.HOME));
  }

  void _yellowToken() {}
  void _greenToken() {}
  void _redToken() {}
  StateModel model;
  bool _diceRolled = false;
  @override
  Widget build(BuildContext context) {
    this.model = ScopedModel.of<StateModel>(context);
    return ScopedModelDescendant<StateModel>(builder: (context, c, model) {
      if (model.playerTurn == widget.playerCode) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white10,
              border: Border.all(
                color: Colors.white30,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: ScaleTransition(
            scale: _animation,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () async {
                _rolleDice(model);
                _diceRolled = true;
                setState(() {});
              },
              child: _diceRolled
                  ? Container(child: Image.asset('assets/dice_play.gif'))
                  : diceNum != 0
                      ? Image.asset('assets/${diceNum}.png')
                      : Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 60,
                          // height: double.infinity,
                          // width: double.infinity,
                          // color: Colors.white,
                          child: Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}

class _CustomPaint extends CustomPainter {
  Paint _paintTr(Color c) {
    final _paint = Paint()
      ..color = c
      ..style = PaintingStyle.fill;
    return _paint;
  }

  @override
  void paint(Canvas canvas, Size size) {
    print(';siza $size');
    var path = Path();
    path.moveTo(-size.height / 2, -size.width / 2);
    path.lineTo(size.width, size.height * .2);
    path.lineTo(size.height, size.width * .8);
    path.close();
    canvas.drawPath(path, _paintTr(Colors.white));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
