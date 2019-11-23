import 'package:flutter/material.dart';
import 'package:ludo_game/src/home.dart';
import 'package:ludo_game/src/state/state_model.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final stateModel = StateModel();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<StateModel>(
      model: stateModel,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
