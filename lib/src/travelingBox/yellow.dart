import 'package:flutter/material.dart';
import 'package:ludo_game/src/state/models/state_model.dart';
import 'package:ludo_game/src/state/traveling_paths.dart';
import 'package:ludo_game/src/tokens/blue.dart';
import 'package:ludo_game/src/tokens/green.dart';
import 'package:ludo_game/src/tokens/red.dart';
import 'package:ludo_game/src/tokens/yellow.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

class YellowPath {
  final int index1;
  final int index2;
  final PlayerCode playerCode;
  YellowPath({this.index1, this.index2, this.playerCode = PlayerCode.YELLOW});
}

class YellowTraveling extends StatefulWidget {
  @override
  _YellowTravelingState createState() => _YellowTravelingState();
}

class _YellowTravelingState extends State<YellowTraveling> {
  List<YellowPath> yellowPath = [];
  int count = 0;
  List<YellowTravelingPath> yellowTravelingPath = [];
  StateModel stateModel;
  @override
  void initState() {
    stateModel = ScopedModel.of<StateModel>(context);
    _init();
    stateModel.yellowTravelingPath = this.yellowTravelingPath;
    stateModel.yellowPath = this.yellowPath;
    super.initState();
  }

  _init() {
    yellowPath.addAll([
      YellowPath(index1: 2, index2: 4, playerCode: PlayerCode.EMPTY),
      YellowPath(index1: 1, index2: 4, playerCode: PlayerCode.EMPTY),
      YellowPath(index1: 1, index2: 3, playerCode: PlayerCode.EMPTY),
      YellowPath(index1: 1, index2: 2, playerCode: PlayerCode.EMPTY),
      YellowPath(index1: 1, index2: 1, playerCode: PlayerCode.EMPTY),
      YellowPath(index1: 1, index2: 0, playerCode: PlayerCode.EMPTY),
    ]);
    for (int index1 = 0; index1 < 3; index1++) {
      for (int index2 = 0; index2 < 6; index2++) {
        yellowTravelingPath.add(YellowTravelingPath(
          index1: count,
          index2: index2,
        ));
        count++;
      }
    }
  }

  Widget moveTokens(int index1, int index2, PlayerCode playerCode) {
    final model =
        ScopedModel.of<StateModel>(context).currentLocationBlueToken[1];
    final yModel =
        ScopedModel.of<StateModel>(context).currentLocationYellowToken[1];
    if (((model.playerCode == playerCode)) &&
        (model.index1 == index1) &&
        (model.index2 == index2))
      return BlueToken();
    else if (((yModel.playerCode == playerCode)) &&
        (yModel.index1 == index1) &&
        (yModel.index2 == index2)) return YellowToken();
    // else if (playerCode == PlayerCode.GREEN &&
    //     model.index1 == index1 &&
    //     model.index2 == index2)
    //   return GreenToken();
    // else if (playerCode == PlayerCode.RED)
    //   return RedToken();
    // else
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    Widget _build(int index1, int index2, c, PlayerCode playerCode) {
      bool paintIt = false;
      for (YellowPath b in yellowPath) {
        if (b.index1 == index1 && b.index2 == index2) {
          paintIt = true;
        }
      }
      if (paintIt) {
        return Container(
          width: c.maxWidth / 6,
          height: c.maxHeight / 3,
          decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(color: Colors.black38, width: .5)),
          child: Stack(
            children: <Widget>[
              Text('$index1, $index2'),
              moveTokens(index1, index2, playerCode)
            ],
          ),
        );
      } else if (index1 == 0 &&
          index2 == 3 &&
          playerCode == PlayerCode.YELLOW) {
        return Container(
            width: c.maxWidth / 6,
            height: c.maxHeight / 3,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Colors.black38, width: .5)),
            child: Stack(
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.black38,
                  size: (c.maxWidth / 6) * .8,
                ),
                Stack(
                  children: <Widget>[
                    Text('$index1, $index2'),
                    moveTokens(index1, index2, playerCode)
                  ],
                ),
              ],
            ));
      } else
        return Container(
          width: c.maxWidth / 6,
          height: c.maxHeight / 3,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38, width: .5)),
          child: Stack(
            children: <Widget>[
              Text('$index1, $index2'),
              moveTokens(index1, index2, playerCode)
            ],
          ),
        );
    }

    return ScopedModelDescendant<StateModel>(
      builder: (context, child, model) {
        return LayoutBuilder(
          builder: (context, c) {
            int count = -1;
            return Column(
                children: List<Widget>.generate(3, (index1) {
              count++;
              return Row(
                children: List<Widget>.generate(6, (index2) {
                  return _build(index1, index2, c,
                      model.yellowTravelingPath[count].playerCode);
                }),
              );
            }));
          },
        );
      },
    );
  }
}
