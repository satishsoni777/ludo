import 'package:flutter/material.dart';
import 'package:ludo_game/src/state/state_model.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

class RedToken extends StatelessWidget {
  final double height;
  final double width;
  final int tokenId;

  final CurrentRedTravelingPath redTravelingPath;
  RedToken({this.height, this.tokenId, this.width, this.redTravelingPath});
  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<StateModel>(context);
    return Container(
      height: height,
      width: width,
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: Colors.black
      //   )
      // ),
      child: FlatButton(
        child: Text(''),
        color: Colors.redAccent,
        shape: CircleBorder(
          side: BorderSide(color: Colors.black)
        ),
        onPressed: () {
          if (model.playerTurn == PlayerCode.RED)
            model.moveForRed(model.diceNumber,
                tokenId: tokenId, currentLocation: redTravelingPath);
        },
        // borderRadius: BorderRadius.circular(height / 2),
      ),
    );
  }
}
