import 'package:flutter/material.dart';
import 'package:ludo_game/src/state/state_model.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

class BluePlayer extends StatelessWidget {
  final Color colorCode;
  BluePlayer({this.colorCode});
  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<StateModel>(context);
    Widget _circle(
        {Color color,
        CurrentBlueTravelingPath currentBlueTravelingPath,
        int tokenId}) {
      if (currentBlueTravelingPath.playerCode == PlayerCode.HOME)
        return InkWell(
          onTap: () {
            int insideHome = 0, outFromGame = 0;
            model.currentLocationBlueToken.forEach((k, v) {
              if (v.playerCode == PlayerCode.HOME) {
                insideHome++;
              } else if (v.playerCode == PlayerCode.BLUEHOME) {
                outFromGame++;
              }
            });
            if (insideHome + outFromGame == 4) {
              for (int i = 1; i <= model.currentLocationBlueToken.length; i++) {
                if (model.currentLocationBlueToken[i].playerCode !=
                    PlayerCode.BLUEHOME) {
                  tokenId = i;
                  break;
                }
              }
            } else {
              if (model.playerTurn == PlayerCode.BLUE &&
                  model.diceNumber == 6 &&
                  model.countNumberOfSix != 3) {
                model.moveForBlue(model.diceNumber,
                    blueTokenId: tokenId,
                    currentLocation: currentBlueTravelingPath);
                       model.diceNumber=0;
              }
            }
          },
          child: Container(
            margin: EdgeInsets.all(5),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                color: blueColorCode,
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
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: blueLightColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
            border: Border.all(color: Colors.black45, width: 1),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                child: Container(
                  child: Row(
                      children: model.currentLocationBlueToken.values.map((s) {
                    if (s.playerCode == PlayerCode.BLUEHOME)
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: blueColorCode,
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
                  return SizedBox(
                      height: contr.maxHeight * .6,
                      width: contr.maxHeight * .6,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue[600],
                              border:
                                  Border.all(color: Colors.black54, width: 1)),
                          child: model.playingBoard == PlayingBoard.All ||
                                  model.playingBoard == PlayingBoard.GREEN_BLUE
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        _circle(
                                            currentBlueTravelingPath: model
                                                .currentLocationBlueToken[1],
                                            tokenId: 1),
                                        _circle(
                                            currentBlueTravelingPath: model
                                                .currentLocationBlueToken[2],
                                            tokenId: 2),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        _circle(
                                            currentBlueTravelingPath: model
                                                .currentLocationBlueToken[3],
                                            tokenId: 3),
                                        _circle(
                                            currentBlueTravelingPath: model
                                                .currentLocationBlueToken[4],
                                            tokenId: 4),
                                      ],
                                    ),
                                  ],
                                )
                              : Container()));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
