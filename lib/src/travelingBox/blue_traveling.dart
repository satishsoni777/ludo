import 'package:flutter/material.dart';
import 'package:ludo_game/utils/util.dart';

class BluePath {
  final int index1;
  final int index2;
  final PlayerCode playerCode;
  BluePath({this.index1, this.index2, this.playerCode = PlayerCode.BLUE});
}

class BlueTraveling extends StatefulWidget {
  @override
  _BlueTravelingState createState() => _BlueTravelingState();
}

class _BlueTravelingState extends State<BlueTraveling> {
  List<BluePath> bluePath = [];
  @override
  void initState() {
    bluePath.addAll([
      BluePath(index1: 1, index2: 2, playerCode: PlayerCode.BLUE),
      BluePath(index1: 1, index2: 1, playerCode: PlayerCode.BLUE),
      BluePath(index1: 2, index2: 1, playerCode: PlayerCode.BLUE),
      BluePath(index1: 3, index2: 1, playerCode: PlayerCode.BLUE),
      BluePath(index1: 4, index2: 1, playerCode: PlayerCode.BLUE),
      BluePath(index1: 5, index2: 1, playerCode: PlayerCode.BLUE),
    ]);
    print(bluePath[0].playerCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _build(int index1, int index2, c, PlayerCode playerCode) {
      bool paintIt = false;
      for (BluePath b in bluePath) {
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
              color: Colors.blue,
              border: Border.all(color: Colors.black38, width: .5)),
          // child: Text('$index1,$index2'),
        );
      } else if (index1 == 2 && index2 == 0 && playerCode == PlayerCode.BLUE) {
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
                // Text('$index1, $index2')
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
              return _build(index1, index2, c, PlayerCode.BLUE);
            }),
          );
        }));
      },
    );
  }
}
