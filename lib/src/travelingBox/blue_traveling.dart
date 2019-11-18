import 'package:flutter/material.dart';
import 'package:ludo_game/src/state/models/state_model.dart';
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
  @override
  void initState() {
    bluePath.addAll([
      BluePath(index1: 1, index2: 2, playerCode: PlayerCode.EMPTY),
      BluePath(index1: 1, index2: 1, playerCode: PlayerCode.EMPTY),
      BluePath(index1: 2, index2: 1, playerCode: PlayerCode.EMPTY),
      BluePath(index1: 3, index2: 1, playerCode: PlayerCode.EMPTY),
      BluePath(index1: 4, index2: 1, playerCode: PlayerCode.EMPTY),
      BluePath(index1: 5, index2: 1, playerCode: PlayerCode.EMPTY),
    ]);
    ScopedModel.of<StateModel>(context).bluePath = bluePath;
    for (int index1 = 0; index1 < 6; index1++) {
      for (int index2 = 0; index2 < 3; index2++) {
        blueTravelingPath.add(BlueTravelingPath(
          index1: count,
          index2: index2,
        ));
        count++;
      }
    }
    ScopedModel.of<StateModel>(context).bluePathTraveling =
        this.blueTravelingPath;
    super.initState();
  }

  Widget _moveCircle(int index1, int index2, PlayerCode playerCode) {
    if (playerCode == PlayerCode.BLUE && index1 == 5 && index2 == 2)
      return Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
      );
    else
      return Container();
  }

  PlayerCode playerCode;
  @override
  Widget build(BuildContext context) {
    Widget _build(int index1, int index2, c, PlayerCode playerCode) {
      // print('inds $index1, $index2');
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
              color: Colors.blue,
              border: Border.all(color: Colors.black38, width: .5)),
          child: Text('$index1,$index2'),
          // child: _moveCircle(index1, index2, playerCode),
        );
      } else if (index1 == 2 && index2 == 0) {
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
                Text('$index1, $index2')
                // _moveCircle(index1, index2, playerCode),
              ],
            ));
      } else
        return Container(
          width: c.maxWidth / 3,
          height: c.maxHeight / 6,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38, width: .5)),
          child: Text('$index1, $index2'),
          // child: _moveCircle(index1, index2, playerCode),
        );
    }

    return LayoutBuilder(
      builder: (context, c) {
        return Column(
            children: List<Widget>.generate(6, (index1) {
          return Row(
            children: List<Widget>.generate(3, (index2) {
              // print('ciir sadsada$index1, $index2');
              return _build(
                  blueTravelingPath[index1].index1,
                  blueTravelingPath[index2].index2,
                  c,
                  blueTravelingPath[index1].playerCode);
            }),
          );
        }));
      },
    );
  }
}

class BlueTravelingPath {
  int index1;
  int index2;
  PlayerCode playerCode;
  BlueTravelingPath(
      {this.index1, this.index2, this.playerCode = PlayerCode.EMPTY});
}
