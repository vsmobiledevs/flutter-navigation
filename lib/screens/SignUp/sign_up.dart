import 'package:flutter/material.dart';
import 'package:flutter_app/screens/SignUp/components/body.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen ({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
