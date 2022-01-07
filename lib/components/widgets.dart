import 'package:flutter/material.dart';

class CustomWidgets {
  static Widget socialButtonCircle(color, icon, {iconColor, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        //width: 50.0,
        //height: 50.0,
          padding: const EdgeInsets.all(20.0),
          //I used some padding without fixed width and height
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: iconColor,
          ) // You can add a Icon instead of text also, like below.
        //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
      ), //
    );
  }
}