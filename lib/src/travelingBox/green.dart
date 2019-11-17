import 'package:flutter/material.dart';
import 'package:ludo_game/utils/util.dart';

class GreenPath {
  final int index1;
  final int index2;
  final PlayerCode playerCode;
  GreenPath({this.index1, this.index2, this.playerCode = PlayerCode.GREEN});
}

final pathMap = <int>[];

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
          // child: Text('$index1,$index2'),
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
                // Text('$index1, $index2'),
              ],
            ));
      } else
        return Container(
            width: c.maxWidth / 3,
            height: c.maxHeight / 6,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black38, width: .5)),
            // child: Text('$index1, $index2'),
            
            );
    }

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
  }
}
