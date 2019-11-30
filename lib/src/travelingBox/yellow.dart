import 'package:flutter/material.dart';
import 'package:ludo_game/src/state/state_model.dart';
import 'package:ludo_game/src/state/traveling_paths.dart';
import 'package:ludo_game/src/tokens/travleling_token.dart';
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
    yellowPath.map((s) {
      ScopedModel.of<StateModel>(context).yellowPath.add(s);
    }).toList(growable: false);
    this.yellowTravelingPath.map((s) {
      ScopedModel.of<StateModel>(context).yellowTravelingPath.add(s);
    }).toList(growable: false);
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
        if (index1 == 2 && index2 == 4)
          yellowTravelingPath.add(YellowTravelingPath(
              index1: index1, index2: index2, playerCode: PlayerCode.STAR));
        else if (index1 == 0 && index2 == 3) {
          yellowTravelingPath.add(YellowTravelingPath(
              index1: index1, index2: index2, playerCode: PlayerCode.STAR));
        } else {
          yellowTravelingPath.add(YellowTravelingPath(
            index1: index1,
            index2: index2,
          ));
        }
        count++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _build(int index1, int index2, c, PlayerCode playerCode) {
      // print('yellow $playerCode');
      bool paintIt = false;
      // print('yellowe $index1, $index2 $playerCode');
      for (YellowPath b in yellowPath) {
        if (b.index1 == index1 && b.index2 == index2) {
          paintIt = true;
        }
      }
      if (paintIt) {
        return Stack(
          children: <Widget>[
            Container(
              width: c.maxWidth / 6,
              height: c.maxHeight / 3,
              decoration: BoxDecoration(
                  color: yellowLightColor,
                  border: Border.all(color: Colors.black38, width: .5)),
              child: moveToken(
                context,
                index1: index1,
                index2: index2,
                playerCode: playerCode,
              ),
            ),
            // Text('$index1,$index2')
          ],
        );
      } else if (index1 == 0 && index2 == 3) {
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
                moveToken(
                  context,
                  index1: index1,
                  index2: index2,
                  playerCode: playerCode,
                ),
                // Text('$index1,$index2')
              ],
            ));
      } else
        return Stack(
          children: <Widget>[
            Container(
                width: c.maxWidth / 6,
                height: c.maxHeight / 3,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38, width: .5)),
                child: moveToken(
                  context,
                  index1: index1,
                  index2: index2,
                  playerCode: playerCode,
                )),
            // Text('$index1,$index2')
          ],
        );
    }

    return ScopedModelDescendant<StateModel>(
      builder: (context, child, model) {
        return LayoutBuilder(
          builder: (context, c) {
            int count = -1;
            return Column(
                children: List<Widget>.generate(3, (index1) {
              return Row(
                children: List<Widget>.generate(6, (index2) {
                  count++;
                  return _build(
                      index1, index2, c, yellowTravelingPath[count].playerCode);
                }),
              );
            }));
          },
        );
      },
    );
  }
}
