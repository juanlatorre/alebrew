import 'package:flutter/material.dart';

Future<dynamic> customBottomSheet(BuildContext context, Widget child) {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(500),
        topRight: Radius.circular(500),
      ),
    ),
    context: context,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.2,
      margin: EdgeInsets.all(50),
      child: child,
    ),
  );
}
