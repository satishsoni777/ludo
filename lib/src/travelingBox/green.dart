import 'package:flutter/material.dart';
import 'package:ludo_game/src/state/state_model.dart';
import 'package:ludo_game/src/state/traveling_paths.dart';
import 'package:ludo_game/src/tokens/travleling_token.dart';
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
  List<GreenTravelingPath> greenTravelingPath = [];

  int count = 0;
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
    for (int index1 = 0; index1 < 6; index1++) {
      for (int index2 = 0; index2 < 3; index2++) {
        if (index1 == 3 && index2 == 2)
          greenTravelingPath.add(GreenTravelingPath(
              index1: index1, index2: index2, playerCode: PlayerCode.STAR));
        else if (index1 == 4 && index2 == 0) {
          greenTravelingPath.add(GreenTravelingPath(
              index1: index1, index2: index2, playerCode: PlayerCode.STAR));
        } else {
          greenTravelingPath.add(GreenTravelingPath(
            index1: index1,
            index2: index2,
          ));
        }
      }
      count++;
    }
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _build(int index1, int index2, c, PlayerCode playerCode) {
      bool paintIt = false;
      for (GreenPath b in greenPath) {
        if (b.index1 == index1 && b.index2 == index2) {
          paintIt = true;
        }
      }
      if (paintIt) {
        return Stack(
          children: <Widget>[
            Container(
              width: c.maxWidth / 3,
              height: c.maxHeight / 6,
              decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(color: Colors.black38, width: .5)),
              child: moveToken(context,
                  index1: index1,
                  index2: index2,
                  playerCode: playerCode,
                  height: c.maxWidth / 3,
                  width: c.maxHeight / 3),
            ),
            // Text('$index1,$index2')
          ],
        );
      } else if (index1 == 3 && index2 == 2) {
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
                moveToken(context,
                    index1: index1,
                    index2: index2,
                    playerCode: playerCode,
                    height: c.maxWidth / 3,
                    width: c.maxHeight / 3),
                // Text('$index1,$index2')
              ],
            ));
      } else
        return Stack(
          children: <Widget>[
            Container(
              width: c.maxWidth / 3,
              height: c.maxHeight / 6,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38, width: .5)),
              child: moveToken(context,
                  index1: index1,
                  index2: index2,
                  playerCode: playerCode,
                  height: c.maxWidth / 3,
                  width: c.maxHeight / 3),
            ),
            // Text('$index1,$index2')
          ],
        );
    }

    return ScopedModelDescendant<StateModel>(
      builder: (context, c, model) {
        int count = -1;
        return LayoutBuilder(
          builder: (context, c) {
            return Column(
                children: List<Widget>.generate(6, (index1) {
              return Row(
                children: List<Widget>.generate(3, (index2) {
                  count++;
                  return _build(
                      index1, index2, c, greenTravelingPath[count].playerCode);
                }),
              );
            }));
          },
        );
      },
    );
  }
}
