import 'package:flutter/material.dart';
import 'package:ludo_game/src/components/3dRenderObject.dart';
import 'package:ludo_game/src/token_paths/green_travleling_path.dart';
import 'package:ludo_game/src/token_paths/yellow_travelling.path.dart';
import 'game_playscreen.dart';
import 'token_paths/blue_traveling_path.dart';
import 'token_paths/red_travleling_path.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Player _player;

  bool isSelected = false;
  int count = 0;
  @override
  void initState() {
    movesForBluePath.forEach((s) {
      movesForBluePath[count].location = count;
      count++;
    });
    count = 0;
    movesForYellowPath.forEach((y) {
      movesForYellowPath[count].location = count;
      count++;
    });
    count = 0;
    movesForGreenPath.forEach((y) {
      movesForYellowPath[count].location = count;
      count++;
    });
    count = 0;
    movesForRedPath.forEach((y) {
      movesForYellowPath[count].location = count;
      count++;
    });
    count = 0;
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff17105D),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  _player = Player.DOUBLE;
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: _player == Player.DOUBLE
                          ? Colors.grey
                          : Colors.transparent,
                      border: Border.all(
                        color: Colors.white,
                      )),
                  height: 40,
                  width: 100,
                  child: Text(
                    'II Players',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  _player = Player.FOURTH;
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: _player == Player.FOURTH
                          ? Colors.grey
                          : Colors.transparent,
                      border: Border.all(
                        color: Colors.white,
                      )),
                  child: Text(
                    'IV Players',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => GamePlayScreen()));
                },
                child: Text(
                  "Start",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Render3dObject(
                zoom: 40.0,
                size: const Size(100.0, 100.0),
                path: "assets/dice.obj",
                asset: true,
                color: Colors.green,
                onTap: () {
                },
              ),
            ],
          ),
        ));
  }
}

enum Player { DOUBLE, FOURTH }
