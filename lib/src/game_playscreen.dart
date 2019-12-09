import 'dart:async';
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
        body: ScopedModelDescendant<StateModel>(
          builder: (context, w, model) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                              backgroundImage:
                                  AssetImage('assets/images/boy1.jpg'),
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
                              backgroundImage:
                                  AssetImage('assets/images/boy1.jpg'),
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
                              backgroundImage:
                                  AssetImage('assets/images/boy1.jpg'),
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
                              backgroundImage:
                                  AssetImage('assets/images/boy1.jpg'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
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
  int countSix = 0;

  DiceRolleLogic diceRolleLogic;
  Random rnd;
  @override
  void initState() {
    this.model = ScopedModel.of<StateModel>(context);
    diceRolleLogic = DiceRolleLogic(model: model);
    rnd = new Random();
    gifController =
        GifController(vsync: this, duration: Duration(milliseconds: 600));
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 1, end: 2).animate(_animationController);
    _animationController.addStatusListener((s) {
      if (s == AnimationStatus.completed) {
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
    diceNum = 0;
    super.initState();
  }

  @override
  void didUpdateWidget(DiceAnimaton oldWidget) {
    diceNum = 0;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    gifController.dispose();
    super.dispose();
  }

  int diceNum = 0;
  void _rolleDice(StateModel model) async {
    await Future.delayed(Duration(milliseconds: 1000), () async {
      diceNum = min + rnd.nextInt(max - min);
      if (diceNum == 6) {
        countSix++;
        model.countNumberOfSix++;
      }
      model.diceNumber = diceNum;
      _diceRolled = false;
      setState(() {});
      print('asdsadsda $countSix');
      if (model.countNumberOfSix == 3) {
        model.diceNumber = 0;
        Timer(Duration(seconds: 1), () {
          if (model.playingBoard == PlayingBoard.All) {
            model.switchUserTurn(model.diceNumber,
                playerCode: widget.playerCode != PlayerCode.RED
                    ? PlayerCode.values[widget.playerCode.index + 1]
                    : PlayerCode.BLUE);
          } else {
            if (model.playingBoard == PlayingBoard.GREEN_BLUE) {
              model.switchUserTurn(model.diceNumber,
                  playerCode: widget.playerCode == PlayerCode.BLUE
                      ? PlayerCode.BLUE
                      : PlayerCode.GREEN);
                      
            }
            else if(model.playingBoard == PlayingBoard.RED_YELLOW){
              if (model.playingBoard == PlayingBoard.GREEN_BLUE) {
              model.switchUserTurn(model.diceNumber,
                  playerCode: widget.playerCode == PlayerCode.RED
                      ? PlayerCode.RED
                      : PlayerCode.YELLOW);
            }
          }
          countSix = 0;
        }});
      } else {
        Timer(Duration(seconds: 1), () {
          if (model.countNumberOfSix != 3) _moveTokes();
        });
      }
    });
  }

  int tokenId = 1;
  var locken;
  _moveTokes() {
    int insideHome = 0, outFromGame = 0;
    // calculating how many token is out and traveling
    if (model.playerTurn == PlayerCode.BLUE) {
      model.currentLocationBlueToken.forEach((k, v) {
        if (v.playerCode == PlayerCode.HOME) {
          insideHome++;
        } else if (v.playerCode == PlayerCode.BLUEHOME) {
          outFromGame++;
        }
      });
      if (insideHome + outFromGame == 4) {
        for (int i = 1; i <= model.currentLocationBlueToken.length; i++) {
          if (model.currentLocationBlueToken[i].playerCode !=
              PlayerCode.BLUEHOME) {
            tokenId = i;
            _blueToken();
            break;
          }
        }
      }

      /// its mean one token is out side and traveling
      else if (insideHome + outFromGame == 3) {
        print('blue 3 ');
        for (int i = 1; i <= model.currentLocationBlueToken.length; i++) {
          if (model.currentLocationBlueToken[i].playerCode !=
                  PlayerCode.BLUEHOME &&
              model.currentLocationBlueToken[i].playerCode != PlayerCode.HOME) {
            tokenId = i;
            if (model.diceNumber != 6)
              _blueToken(
                  currentBlueTravelingPath:
                      model.currentLocationBlueToken[tokenId]);
            break;
          }
        }
      }
      print("count.... ${model.countNumberOfSix}");
    } else if (model.playerTurn == PlayerCode.YELLOW) {
      model.currentLocationYellowToken.forEach((k, v) {
        if (v.playerCode == PlayerCode.HOME) {
          insideHome++;
        } else if (v.playerCode == PlayerCode.YELLOWHOME) {
          outFromGame++;
        }
      });
      print(insideHome);
      if (insideHome + outFromGame == 4) {
        for (int i = 1; i <= model.currentLocationYellowToken.length; i++) {
          if (model.currentLocationYellowToken[i].playerCode !=
              PlayerCode.YELLOWHOME) {
            tokenId = i;
            _yellowToken();
            break;
          }
        }
      }

      /// its mean one token is out side and traveling
      else if (insideHome + outFromGame == 3) {
        for (int i = 1; i <= model.currentLocationYellowToken.length; i++) {
          if (model.currentLocationYellowToken[i].playerCode !=
                  PlayerCode.YELLOWHOME &&
              model.currentLocationYellowToken[i].playerCode !=
                  PlayerCode.HOME) {
            tokenId = i;
            if (model.diceNumber != 6)
              _yellowToken(
                  currentYellowTravelingPath:
                      model.currentLocationYellowToken[tokenId]);
            break;
          }
        }
      }
    } else if (model.playerTurn == PlayerCode.GREEN) {
      model.currentLocationGreenToken.forEach((k, v) {
        if (v.playerCode == PlayerCode.HOME) {
          insideHome++;
        } else if (v.playerCode == PlayerCode.GREENHOME) {
          outFromGame++;
        }
      });
      print(insideHome);
      if (insideHome + outFromGame == 4) {
        for (int i = 1; i <= model.currentLocationGreenToken.length; i++) {
          if (model.currentLocationGreenToken[i].playerCode !=
              PlayerCode.YELLOWHOME) {
            tokenId = i;
            _greenToken();
            break;
          }
        }
      }

      /// its mean one token is out side and traveling
      else if (insideHome + outFromGame == 3) {
        for (int i = 1; i <= model.currentLocationGreenToken.length; i++) {
          if (model.currentLocationGreenToken[i].playerCode !=
                  PlayerCode.GREENHOME &&
              model.currentLocationGreenToken[i].playerCode !=
                  PlayerCode.HOME) {
            tokenId = i;
            if (model.diceNumber != 6)
              _greenToken(
                  currentGreenTravelingPath:
                      model.currentLocationGreenToken[tokenId]);
            break;
          }
        }
      }
    } else if (model.playerTurn == PlayerCode.RED) {
      model.currentLocationRedToken.forEach((k, v) {
        if (v.playerCode == PlayerCode.HOME) {
          insideHome++;
        } else if (v.playerCode == PlayerCode.REDHOME) {
          outFromGame++;
        }
      });
      print(insideHome);
      if (insideHome + outFromGame == 4) {
        for (int i = 1; i <= model.currentLocationRedToken.length; i++) {
          if (model.currentLocationRedToken[i].playerCode !=
              PlayerCode.REDHOME) {
            tokenId = i;
            _redToken();
            break;
          }
        }
      }

      /// its mean one token is out side and traveling
      else if (insideHome + outFromGame == 3) {
        print('inside 3 red');
        for (int i = 1; i <= model.currentLocationRedToken.length; i++) {
          if (model.currentLocationRedToken[i].playerCode !=
                  PlayerCode.REDHOME &&
              model.currentLocationRedToken[i].playerCode != PlayerCode.HOME) {
            tokenId = i;
            if (model.diceNumber != 6)
              _redToken(
                  currentRedTravelingPath:
                      model.currentLocationRedToken[tokenId]);
            break;
          }
        }
      }
    }
  }

  void _blueToken({CurrentBlueTravelingPath currentBlueTravelingPath}) {
    model.moveForBlue(diceNum,
        blueTokenId: tokenId,
        currentLocation: CurrentBlueTravelingPath(
            currentPosition: currentBlueTravelingPath?.currentPosition ?? -1,
            tokenId: tokenId,
            playerCode:
                currentBlueTravelingPath?.playerCode ?? PlayerCode.HOME));
  }

  void _yellowToken({CurrentYellowTravelingPath currentYellowTravelingPath}) {
    print('yellow auto call');
    model.moveForYellow(model.diceNumber,
        yellowTokenId: tokenId,
        currentLocation: CurrentYellowTravelingPath(
            currentPosition: currentYellowTravelingPath?.currentPosition ?? -1,
            tokenId: tokenId,
            playerCode:
                currentYellowTravelingPath?.playerCode ?? PlayerCode.HOME));
  }

  void _greenToken({CurrentGreenTravelingPath currentGreenTravelingPath}) {
    model.moveForGreen(model.diceNumber,
        tokenId: tokenId,
        currentLocation: CurrentGreenTravelingPath(
            currentPosition: currentGreenTravelingPath?.currentPosition ?? -1,
            tokenId: tokenId,
            playerCode:
                currentGreenTravelingPath?.playerCode ?? PlayerCode.HOME));
  }

  void _redToken({CurrentRedTravelingPath currentRedTravelingPath}) {
    model.moveForRed(model.diceNumber,
        tokenId: tokenId,
        currentLocation: CurrentRedTravelingPath(
            currentPosition: currentRedTravelingPath?.currentPosition ?? -1,
            tokenId: tokenId,
            playerCode:
                currentRedTravelingPath?.playerCode ?? PlayerCode.HOME));
  }

  StateModel model;
  bool _diceRolled = false;
  @override
  Widget build(BuildContext context) {
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
              onTap: !_diceRolled && diceNum == 0
                  ? () async {
                      _rolleDice(model);
                      _diceRolled = true;
                      setState(() {});
                    }
                  : () {},
              child: _diceRolled
                  ? Container(child: Image.asset('assets/dice_play.gif'))
                  : model.diceNumber != 0
                      ? Image.asset('assets/${model.diceNumber}.png')
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

class DiceRolleLogic {
  final StateModel model;
  int tokenId;
  DiceRolleLogic({
    this.model,
  });
  void yellowToken({CurrentYellowTravelingPath currentYellowTravelingPath}) {
    print('yellow auto call');
    model.moveForYellow(model.diceNumber,
        yellowTokenId: tokenId,
        currentLocation: CurrentYellowTravelingPath(
            currentPosition: currentYellowTravelingPath?.currentPosition ?? -1,
            tokenId: tokenId,
            playerCode:
                currentYellowTravelingPath?.playerCode ?? PlayerCode.HOME));
  }

  void greenToken({CurrentGreenTravelingPath currentGreenTravelingPath}) {
    model.moveForGreen(model.diceNumber,
        tokenId: tokenId,
        currentLocation: CurrentGreenTravelingPath(
            currentPosition: currentGreenTravelingPath?.currentPosition ?? -1,
            tokenId: tokenId,
            playerCode:
                currentGreenTravelingPath?.playerCode ?? PlayerCode.HOME));
  }

  void redToken({CurrentRedTravelingPath currentRedTravelingPath}) {
    model.moveForRed(model.diceNumber,
        tokenId: tokenId,
        currentLocation: CurrentRedTravelingPath(
            currentPosition: currentRedTravelingPath?.currentPosition ?? -1,
            tokenId: tokenId,
            playerCode:
                currentRedTravelingPath?.playerCode ?? PlayerCode.HOME));
  }
}
