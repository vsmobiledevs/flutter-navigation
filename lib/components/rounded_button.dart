import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      onPressed: () {press();},
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, //button's fill color
        onPrimary: Colors.red, //specify the color of the button's text and icons as well as the overlay colors used to indicate the hover, focus, and pressed states
        onSurface: Colors.blue, //specify the button's disabled text, icon, and fill color
        shadowColor: Colors.black, //specify the button's elevation color
        elevation: 4.0, //buttons Material shadow
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        textStyle: TextStyle(
            color: textColor, fontSize: 14, fontWeight: FontWeight.w700),
        minimumSize: Size(20, 40), //specify the button's first: width and second: height
        side: BorderSide(color: Colors.blue, width: 2.0, style: BorderStyle.solid), //set border for the button
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)), // set the buttons shape. Make its birders rounded etc
        enabledMouseCursor: MouseCursor.defer, //used to construct ButtonStyle.mouseCursor
        disabledMouseCursor: MouseCursor.uncontrolled, //used to construct ButtonStyle.mouseCursor
        visualDensity: VisualDensity(horizontal: 0.5, vertical: 0.0), //set the button's visual density
        tapTargetSize: MaterialTapTargetSize.padded, // set the MaterialTapTarget size. can set to: values, padded and shrinkWrap properties
        animationDuration: Duration(milliseconds: 100), //the buttons animations duration
        enableFeedback: true, //to set the feedback to true or false
        alignment: Alignment.bottomCenter, //set the button's child Alignment
      ),
    );
  }
}