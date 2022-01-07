import 'package:flutter/material.dart';
import 'package:flutter_app/screens/BottomTabs/home.dart';
import 'dart:async';
import 'package:flutter_app/screens/Login/login.dart';
import 'package:flutter_app/screens/SignUp/sign_up.dart';
import 'package:flutter_app/screens/Splash/components/body.dart';
import 'package:flutter_app/screens/BottomTabs/bottom_tabs_nav.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>{
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
            seconds: 3
        ),
            (){
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
