import 'package:flutter/material.dart';
import 'package:ludo_game/src/state/state_model.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

class GreenPlayer extends StatelessWidget {
  final Color boardColor;
  GreenPlayer({this.boardColor});

  @override
  Widget build(BuildContext context) {
    Widget _circle(
        {Color color,
        CurrentGreenTravelingPath currentGreenTravelingPath,
        int tokenId}) {
      final model = ScopedModel.of<StateModel>(context);
      if (currentGreenTravelingPath.playerCode == PlayerCode.HOME)
        return InkWell(
          onTap: () {
            int insideHome = 0, outFromGame = 0;
            model.currentLocationGreenToken.forEach((k, v) {
              if (v.playerCode == PlayerCode.HOME) {
                insideHome++;
              } else if (v.playerCode == PlayerCode.BLUEHOME) {
                outFromGame++;
              }
            });
            if (insideHome + outFromGame == 4) {
              for (int i = 1;
                  i <= model.currentLocationGreenToken.length;
                  i++) {
                if (model.currentLocationGreenToken[i].playerCode !=
                    PlayerCode.BLUEHOME) {
                  tokenId = i;
                  break;
                }
              }
            } else {
              if (model.playerTurn == PlayerCode.GREEN &&
                  model.diceNumber == 6 &&
                  model.countNumberOfSix != 3) {
                model.moveForGreen(model.diceNumber,
                    tokenId: tokenId,
                    currentLocation: currentGreenTravelingPath);
                       model.diceNumber=0;
              }
            }
            //    if(model.playerTurn==PlayerCode.GREEN && model.diceNumber==6)
            // model.moveForGreen(model.diceNumber,
            //     tokenId: tokenId, currentLocation: currentGreenTravelingPath);
          },
          child: Container(
            margin: EdgeInsets.all(5),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                color: Colors.greenAccent,
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
      builder: (context, child, model) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(10)),
                  border: Border.all(color: Colors.black45, width: 1),
                  color: boardColor),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                child: Row(
                    children: model.currentLocationGreenToken.values.map((s) {
                  if (s.playerCode == PlayerCode.GREENHOME)
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
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
            model.playingBoard == PlayingBoard.All ||
                    model.playingBoard == PlayingBoard.GREEN_BLUE
                ? Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            _circle(
                                currentGreenTravelingPath:
                                    model.currentLocationGreenToken[1],
                                tokenId: 1),
                            _circle(
                                currentGreenTravelingPath:
                                    model.currentLocationGreenToken[2],
                                tokenId: 2),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            _circle(
                                currentGreenTravelingPath:
                                    model.currentLocationGreenToken[3],
                                tokenId: 3),
                            _circle(
                                currentGreenTravelingPath:
                                    model.currentLocationGreenToken[4],
                                tokenId: 4),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
