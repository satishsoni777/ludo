import 'package:flutter/material.dart';
import 'package:ludo_game/src/state/models/state_model.dart';
import 'package:ludo_game/src/tokens/blue.dart';
import 'package:ludo_game/src/tokens/yellow.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

class GreenPath {
  final int index1;
  final int index2;
  final PlayerCode playerCode;
  GreenPath({this.index1, this.index2, this.playerCode = PlayerCode.GREEN});
}

class GreenTraveling extends StatefulWidget {
  @override
  _GreenTravelingState createState() => _GreenTravelingState();
}

class _GreenTravelingState extends State<GreenTraveling> {
  List<GreenPath> greenPath = [];
  @override
  void initState() {
    greenPath.addAll([
      GreenPath(index1: 4, index2: 0, playerCode: PlayerCode.GREEN),
      GreenPath(index1: 4, index2: 1, playerCode: PlayerCode.GREEN),
      GreenPath(index1: 3, index2: 1, playerCode: PlayerCode.GREEN),
      GreenPath(index1: 2, index2: 1, playerCode: PlayerCode.GREEN),
      GreenPath(index1: 1, index2: 1, playerCode: PlayerCode.GREEN),
      GreenPath(index1: 0, index2: 1, playerCode: PlayerCode.GREEN),
    ]);
    super.initState();
  }

  Widget moveTokens(int index1, int index2, PlayerCode playerCode) {
      final yModel =
        ScopedModel.of<StateModel>(context).currentLocationYellowToken[1];
    final model =
        ScopedModel.of<StateModel>(context).currentLocationBlueToken[1];
    if (((model.playerCode == playerCode)) &&
        (model.index1 == index1) &&
        (model.index2 == index2)) return BlueToken();
    // else if (playerCode == PlayerCode.YELLOW)
    //   return YellowToken();
    else if (((yModel.playerCode == playerCode)) &&
        (yModel.index1 == index1) &&
        (yModel.index2 == index2)) return YellowToken();
    // else if (playerCode == PlayerCode.RED)
    //   return RedToken();
    // else
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    Widget _build(int index1, int index2, c, PlayerCode playerCode) {
      bool paintIt = false;
      for (GreenPath b in greenPath) {
        if (b.index1 == index1 &&
            b.index2 == index2 &&
            b.playerCode == playerCode) {
          paintIt = true;
        }
      }
      if (paintIt) {
        return Container(
          width: c.maxWidth / 3,
          height: c.maxHeight / 6,
          decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.black38, width: .5)),
          child: Stack(
            children: <Widget>[
              moveTokens(index1, index2, playerCode),
              Text('$index1, $index2')
            ],
          ),
        );
      } else if (index1 == 3 && index2 == 2 && playerCode == PlayerCode.GREEN) {
        return Container(
            width: c.maxWidth / 3,
            height: c.maxHeight / 6,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Colors.black38, width: .5)),
            child: Stack(
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.black38,
                  size: (c.maxWidth / 3) * .8,
                ),
                Stack(
                  children: <Widget>[
                    moveTokens(index1, index2, playerCode),
                    Text('$index1, $index2')
                  ],
                ),
              ],
            ));
      } else
        return Container(
          width: c.maxWidth / 3,
          height: c.maxHeight / 6,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38, width: .5)),
          child: Stack(
            children: <Widget>[
              moveTokens(index1, index2, playerCode),
              Text('$index1, $index2')
            ],
          ),
        );
    }

    return ScopedModelDescendant<StateModel>(
      builder: (context, c, model) {
        return LayoutBuilder(
          builder: (context, c) {
            return Column(
                children: List<Widget>.generate(6, (index1) {
              return Row(
                children: List<Widget>.generate(3, (index2) {
                  return _build(index1, index2, c, PlayerCode.GREEN);
                }),
              );
            }));
          },
        );
      },
    );
  }
}
