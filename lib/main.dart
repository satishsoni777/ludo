import 'package:flutter/material.dart';
import 'package:ludo_game/src/game_playscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff17105D),
      body: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => GamePlayScreen()));
          },
          child: Text("Start",style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
