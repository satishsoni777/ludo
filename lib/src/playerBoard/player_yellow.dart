import 'package:flutter/material.dart';
import 'package:ludo_game/src/state/state_model.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

class YellowPlayer extends StatelessWidget {
  final Color colorCode;
  YellowPlayer({this.colorCode});
  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<StateModel>(context);
    Widget _circle({
      Color color,
      int tokenId,
      CurrentYellowTravelingPath currentYellowTravelingPath,
    }) {
      if (currentYellowTravelingPath.playerCode == PlayerCode.HOME)
        return InkWell(
          onTap: () {
            if(model.playerTurn==PlayerCode.YELLOW && model.diceNumber==6)
            model.moveForYellow(model.diceNumber,
                yellowTokenId: tokenId,
                currentLocation: currentYellowTravelingPath);
          },
          child: Container(
            margin: EdgeInsets.all(5),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                color: colorCode,
                shape: BoxShape.circle),
          ),
        );
      else
        return Container(
          margin: EdgeInsets.all(5),
          height: 25,
          width: 25,
          decoration:
              BoxDecoration(color: Colors.yellowAccent, shape: BoxShape.circle),
        );
    }

    return ScopedModelDescendant<StateModel>(
      builder: (context, c, model) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(10)),
                  border: Border.all(color: Colors.black45, width: 1),
                  color: Color(0xffffff50)),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                child: Row(
                    children: model.currentLocationYellowToken.values.map((s) {
                  if (s.playerCode == PlayerCode.YELLOWHOME)
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(12.5)),
                      ),
                    );
                  else
                    return Container();
                }).toList(growable: false)),
              ),
            ),
            LayoutBuilder(
              builder: (context, contr) {
                print(contr);
                return SizedBox(
                  height: contr.maxHeight * .6,
                  width: contr.maxHeight * .6,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        border: Border.all(color: Colors.black54, width: 1)),
                  ),
                );
              },
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _circle(
                          tokenId: 1,
                          currentYellowTravelingPath:
                              model.currentLocationYellowToken[1]),
                      _circle(
                          tokenId: 2,
                          currentYellowTravelingPath:
                              model.currentLocationYellowToken[2]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _circle(
                          tokenId: 3,
                          currentYellowTravelingPath:
                              model.currentLocationYellowToken[3]),
                      _circle(
                          tokenId: 4,
                          currentYellowTravelingPath:
                              model.currentLocationYellowToken[4]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
