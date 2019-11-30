import 'package:flutter/material.dart';
import 'package:ludo_game/src/state/state_model.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

class GreenToken extends StatelessWidget {
  final int tokenId;
  double height;
  double width;
  final CurrentGreenTravelingPath greenTravelingPath;
  GreenToken({
    this.tokenId,
    this.height = 8,
    this.width = 8,
    this.greenTravelingPath,
  });
  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<StateModel>(context);
    return Container(
      height: height,
      width: width,
      child: FlatButton(
        child: Text(''),
        color: Colors.greenAccent,
        shape: CircleBorder(side: BorderSide(color: Colors.black)),
        onPressed: () {
          if (model.playerTurn == PlayerCode.GREEN)
            model.moveForGreen(model.diceNumber,
                tokenId: tokenId, currentLocation: greenTravelingPath);
        },
        // borderRadius: BorderRadius.circular(height / 2),
      ),
    );
  }
}
