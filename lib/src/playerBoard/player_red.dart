import 'package:flutter/material.dart';
import 'package:ludo_game/src/state/state_model.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

class RedPlayer extends StatelessWidget {
  final Color colorCode;
  RedPlayer({this.colorCode});
  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<StateModel>(context);
    Widget circle(
        {Color color,
        CurrentRedTravelingPath currentRedTravelingPath,
        int tokenId}) {
      if (currentRedTravelingPath.playerCode == PlayerCode.HOME)
        return InkWell(
          onTap: () {
            if (model.diceNumber == 6) {}
            model.moveForRed(6,
                tokenId: tokenId,
                currentLocation: currentRedTravelingPath);
          },
          child: Container(
            margin: EdgeInsets.all(5),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                color: Colors.red,
                shape: BoxShape.circle),
          ),
        );
      else
        return Container(
          margin: EdgeInsets.all(5),
          height: 25,
          width: 25,
          decoration:
              BoxDecoration(color: Colors.white30, shape: BoxShape.circle),
        );
    }

    return ScopedModelDescendant<StateModel>(
      builder: (context, c, model) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                  border: Border.all(color: Colors.black45, width: 1),
                  color: Colors.red),
            ),
            LayoutBuilder(
              builder: (context, contr) {
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
                      circle(
                          currentRedTravelingPath:
                              model.currentLocationRedToken[1],
                          tokenId: 1),
                      circle(
                          currentRedTravelingPath:
                              model.currentLocationRedToken[2],
                          tokenId: 2),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      circle(
                          currentRedTravelingPath:
                              model.currentLocationRedToken[3],
                          tokenId: 3),
                      circle(
                          currentRedTravelingPath:
                              model.currentLocationRedToken[4],
                          tokenId: 4),
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
