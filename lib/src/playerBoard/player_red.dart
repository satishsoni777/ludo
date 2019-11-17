import 'package:flutter/material.dart';

class RedPlayer extends StatelessWidget {
  final Color colorCode;
  RedPlayer({this.colorCode});
 @override
  Widget build(BuildContext context) {
     Widget _circle({Color color}) {
      return Container(
        margin: EdgeInsets.all(5),
         height: 25,
        width: 25,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black45),
            color: colorCode,
            shape: BoxShape.circle),
      );
    }
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
            print(contr);
            return SizedBox(
              height: contr.maxHeight * .6,
              width: contr.maxHeight * .6,
              child: Container(
                decoration: BoxDecoration(  color: Colors.white54,
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
                   _circle(),
                 _circle(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                 _circle(),
                 _circle(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
