import 'package:flutter/material.dart';
import 'package:ludo_game/src/state/state_model.dart';
import 'package:ludo_game/src/state/traveling_paths.dart';
import 'package:ludo_game/src/tokens/travleling_token.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

class BluePath {
  final int index1;
  final int index2;
  final PlayerCode playerCode;
  BluePath({this.index1, this.index2, this.playerCode = PlayerCode.EMPTY});
}

class BlueTraveling extends StatefulWidget {
  @override
  _BlueTravelingState createState() => _BlueTravelingState();
}

class _BlueTravelingState extends State<BlueTraveling> {
  List<BluePath> bluePath = [];
  List<BlueTravelingPath> blueTravelingPath = [];
  int count = 0;
  StateModel model;
  @override
  void initState() {
    _init();
    bluePath.map((s) {
      ScopedModel.of<StateModel>(context).bluePath.add(s);
    }).toList(growable: false);
    this.blueTravelingPath.map((s) {
      ScopedModel.of<StateModel>(context).blueTravelingPath.add(s);
    }).toList(growable: false);
    super.initState();
  }

  _init() {
    bluePath.addAll([
      BluePath(index1: 1, index2: 2, playerCode: PlayerCode.BLUE),
      BluePath(index1: 1, index2: 1, playerCode: PlayerCode.BLUE),
      BluePath(index1: 2, index2: 1, playerCode: PlayerCode.BLUE),
      BluePath(index1: 3, index2: 1, playerCode: PlayerCode.BLUE),
      BluePath(index1: 4, index2: 1, playerCode: PlayerCode.BLUE),
      BluePath(index1: 5, index2: 1, playerCode: PlayerCode.BLUE),
    ]);
    for (int index1 = 0; index1 < 6; index1++) {
      for (int index2 = 0; index2 < 3; index2++) {
        if (index1 == 1 && index2 == 2)
          blueTravelingPath.add(BlueTravelingPath(
              index1: index1, index2: index2, playerCode: PlayerCode.BLUESTAR));
        else if (index1 == 2 && index2 == 0) {
          blueTravelingPath.add(BlueTravelingPath(
              index1: index1, index2: index2, playerCode: PlayerCode.BLUESTAR));
        } else {
          blueTravelingPath.add(BlueTravelingPath(
            index1: index1,
            index2: index2,
          ));
        }
      }
      count++;
    }
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    model = ScopedModel.of<StateModel>(context);
    Widget _build(
        int index1, int index2, BoxConstraints c, PlayerCode playerCode) {
      
// print('player code blue $playerCode $index1,$index2');
      bool paintIt = false;
      for (BluePath b in bluePath) {
        if (b.index1 == index1 && b.index2 == index2) {
          paintIt = true;
        }
      }
      if (paintIt) {
        return Container(
          width: c.maxWidth / 3,
          height: c.maxHeight / 6,
          decoration: BoxDecoration(
              color: blueLightColor,
              border: Border.all(color: Colors.black38, width: .5)),
          // child: Text('$index1,$index2'),
          child: moveToken(context,
              index1: index1, index2: index2, playerCode: playerCode),
        );
      } else if (index1 == 2 && index2 == 0) {
        return Container(
            width: c.maxWidth / 3,
            height: c.maxHeight / 6,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Colors.black38, width: .5)),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.black38,
                  size: (c.maxWidth / 3) * .8,
                ),
                // Text('$index1, $index2'),
                moveToken(context,
                    index1: index1,
                    index2: index2,
                    playerCode: playerCode,
                    height: c.maxWidth / 3,
                    width: c.maxHeight / 3),
              ],
            ));
      } else
        return Container(
          alignment: Alignment.center,
          width: c.maxWidth / 3,
          height: c.maxHeight / 6,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38, width: .5)),
          // child: Text('$index1, $index2'),
          child: moveToken(context,
              index1: index1, index2: index2, playerCode: playerCode),
        );
    }

    return ScopedModelDescendant<StateModel>(
      builder: (context, child, StateModel model) {
        int count = -1;
        return LayoutBuilder(
          builder: (context, c) {
            return Column(
              children: List<Widget>.generate(6, (index1) {
                return Row(
                  children: List<Widget>.generate(3, (index2) {
                    count++;
                    // return Text('');
                    return _build(
                        index1, index2, c, blueTravelingPath[count].playerCode);
                  }, growable: false),
                );
              }, growable: false),
            );
          },
        );
      },
    );
  }
}
