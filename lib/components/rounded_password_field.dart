import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hint;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
      child: TextField(
          obscureText: true,
          onChanged: onChanged,
          cursorColor: Colors.blue,
          decoration: InputDecoration(
              border:  OutlineInputBorder(
                  borderSide:  const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(35.0)),
              hintText: hint,
              labelText: hint,
              prefixIcon: const Icon(
                Icons.lock,
                color: kPrimaryColor,
              ),
           ),
          style: const TextStyle(color: Colors. blue),
        ),
    );
  }
}
