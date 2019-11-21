import 'package:flutter/material.dart';
import 'package:ludo_game/src/traveling_paths/blue_traveling_path.dart';

import 'game_playscreen.dart';

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
              )
            ],
          ),
        ));
  }
}

enum Player { DOUBLE, FOURTH }
