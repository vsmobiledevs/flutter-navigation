import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.icon =  Icons.person,
    required this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
      child: TextField(
          onChanged: onChanged,
          cursorColor: kPrimaryColor,
          // keyboardType: TextInputType.text,
          decoration: InputDecoration(
          border:  OutlineInputBorder(
            borderSide:  const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(35.0)),
            hintText: hintText,
            labelText: labelText,
            prefixIcon: Icon(
              icon,
              color: kPrimaryColor,
              size: 20,
          ),
          ),
        style: TextStyle(color: Colors. blue),
      ),
    );
  }
}
