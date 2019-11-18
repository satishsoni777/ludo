import 'package:flutter/material.dart';
import 'package:ludo_game/utils/util.dart';

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
  @override
  void initState() {
    yellowPath.addAll([
      YellowPath(index1: 2, index2: 4, playerCode: PlayerCode.YELLOW),
      YellowPath(index1: 1, index2: 4, playerCode: PlayerCode.YELLOW),
      YellowPath(index1: 1, index2: 3, playerCode: PlayerCode.YELLOW),
      YellowPath(index1: 1, index2: 2, playerCode: PlayerCode.YELLOW),
      YellowPath(index1: 1, index2: 1, playerCode: PlayerCode.YELLOW),
      YellowPath(index1: 1, index2: 0, playerCode: PlayerCode.YELLOW),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _build(int index1, int index2, c, PlayerCode playerCode) {
      bool paintIt = false;
      for (YellowPath b in yellowPath) {
        if (b.index1 == index1 &&
            b.index2 == index2 &&
            b.playerCode == playerCode) {
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
          child: Text('$index1,$index2'),
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
                Text('$index1, $index2')
              ],
            ));
      } else
        return Container(
            width: c.maxWidth / 6,
            height: c.maxHeight / 3,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black38, width: .5)),
            child: Text('$index1, $index2'),
            
            );
    }

    return LayoutBuilder(
      builder: (context, c) {
        return Column(
            children: List<Widget>.generate(3, (index1) {
          return Row(
            children: List<Widget>.generate(6, (index2) {
              return _build(index1, index2, c, PlayerCode.YELLOW);
            }),
          );
        }));
      },
    );
  }
}
