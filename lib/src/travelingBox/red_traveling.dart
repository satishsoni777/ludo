import 'package:flutter/material.dart';
import 'package:ludo_game/src/state/state_model.dart';
import 'package:ludo_game/src/state/traveling_paths.dart';
import 'package:ludo_game/src/tokens/blue.dart';
import 'package:ludo_game/src/tokens/travleling_token.dart';
import 'package:ludo_game/src/tokens/yellow.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

class RedPath {
  final int index1;
  final int index2;
  final PlayerCode playerCode;
  RedPath({this.index1, this.index2, this.playerCode = PlayerCode.RED});
}

class RedTraveling extends StatefulWidget {
  @override
  _RedTravelingState createState() => _RedTravelingState();
}

class _RedTravelingState extends State<RedTraveling> {
  List<RedPath> redPath = [];

  List<RedTravelingPath> redTravelingPath = [];
  int count = -1;
  @override
  void initState() {
    redPath.addAll([
      RedPath(index1: 0, index2: 1, playerCode: PlayerCode.RED),
      RedPath(index1: 1, index2: 1, playerCode: PlayerCode.RED),
      RedPath(index1: 1, index2: 2, playerCode: PlayerCode.RED),
      RedPath(index1: 1, index2: 3, playerCode: PlayerCode.RED),
      RedPath(index1: 1, index2: 4, playerCode: PlayerCode.RED),
      RedPath(index1: 1, index2: 5, playerCode: PlayerCode.RED),
    ]);
    for (int index1 = 0; index1 < 3; index1++) {
      for (int index2 = 0; index2 < 6; index2++) {
        redTravelingPath.add(RedTravelingPath(
          index1: index1,
          index2: index2,
        ));
        count++;
      }
    }
    count = 0;
    super.initState();
  }

  Widget moveTokens(int index1, int index2, PlayerCode playerCode) {
    final yModel =
        ScopedModel.of<StateModel>(context).currentLocationYellowToken[1];
    final model =
        ScopedModel.of<StateModel>(context).currentLocationBlueToken[1];
    if (((model.playerCode == playerCode)) &&
        (model.index1 == index1) &&
        (model.index2 == index2))
      return BlueToken();
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
      for (RedPath b in redPath) {
        if (b.index1 == index1 &&
            b.index2 == index2) {
          paintIt = true;
        }
      }
      if (paintIt) {
        return Container(
          width: c.maxWidth / 6,
          height: c.maxHeight / 3,
          decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.black38, width: .5)),
          child: moveToken(
            context,
            index1: index1,
            index2: index2,
            playerCode: playerCode,
          ),
        );
      } else if (index1 == 2 && index2 == 2 && playerCode == PlayerCode.RED) {
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
                Text('$index1,$index2')
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
              ),
            ),
            Text('$index1$index2')
          ],
        );
    }

    return ScopedModelDescendant<StateModel>(
      builder: (context, child, StateModel model) {
        int count = -1;
        return LayoutBuilder(
          builder: (context, c) {
            return Column(
              children: List<Widget>.generate(3, (index1) {
                return Row(
                  children: List<Widget>.generate(6, (index2) {
                    count++;
                    // return Text('');
                    return _build(
                        index1, index2, c, redTravelingPath[count].playerCode);
                  }, growable: false),
                );
              }, growable: false),
            );
          },
        );
      },
    );
    return LayoutBuilder(
      builder: (context, c) {
        return Column(
            children: List<Widget>.generate(3, (index1) {
          return Row(
            children: List<Widget>.generate(6, (index2) {
              return _build(index1, index2, c, PlayerCode.RED);
            }),
          );
        }));
      },
    );
  }
}
