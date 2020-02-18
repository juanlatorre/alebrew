import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ArrowDownButton extends StatelessWidget {
  ArrowDownButton({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      child: RawMaterialButton(
        elevation: 0,
        fillColor: Colors.pink[200],
        child: Padding(
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
            ],
          ),
        ),
        onPressed: onPressed,
      )
    );
  }
}

 