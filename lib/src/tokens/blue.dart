import 'package:flutter/material.dart';
import 'package:ludo_game/src/components/3dRenderObject.dart';
import 'package:ludo_game/src/state/state_model.dart';
import 'package:ludo_game/utils/util.dart';
import 'package:scoped_model/scoped_model.dart';

class BlueToken extends StatelessWidget {
  final int tokenId;
  double height;
  double width;
  final CurrentBlueTravelingPath blueTravelingPath;
  BlueToken({
    this.tokenId,
    this.height = 8,
    this.width = 8,
    this.blueTravelingPath,
  });
  @override
  Widget build(BuildContext context) {
    print(tokenId);
    final model = ScopedModel.of<StateModel>(context);
  return  Container(
      height: height,
      width: width,
      child: FlatButton(
        child: Text(''),
        color: blueColorCode,
        shape: CircleBorder(),
        onPressed: () {
          if (model.playerTurn == PlayerCode.BLUE && model.diceNumber != 0)
            model.moveForBlue(model.diceNumber,
                blueTokenId: tokenId, currentLocation: blueTravelingPath);
        },
        // borderRadius: BorderRadius.circular(height / 2),
      ),
    );
    return Container(
      height: 20,
      width: 20,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Render3dObject(
          zoom: 10.0,
          size: const Size(20.0, 20.0),
          path: "assets/dice.obj",
          asset: true,
          color: Colors.blue,
          onTap: () {
            print('object');
          },
        ),
      ),
    );
  }
}
