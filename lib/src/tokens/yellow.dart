import 'package:flutter/material.dart';
import 'package:ludo_game/src/state/state_model.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

class YellowToken extends StatelessWidget {
  final int tokenId;
  double height;
  double width;
  final CurrentYellowTravelingPath yellowTravelingPath;
  YellowToken({
    this.tokenId,
    this.height = 8,
    this.width = 8,
    this.yellowTravelingPath,
  });
  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<StateModel>(context);
    return Container(
      height: height,
      width: width,
      child: FlatButton(
        child: Text(''),
        color: yellowDarkColor,
        shape: CircleBorder(side: BorderSide(color: Colors.black)),
        onPressed: () {
          if (model.diceNumber != 0)
            model.moveForYellow(model.diceNumber,
                yellowTokenId: tokenId, currentLocation: yellowTravelingPath);
        },
        // borderRadius: BorderRadius.circular(height / 2),
      ),
    );
  }
}
