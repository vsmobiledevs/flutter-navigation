import 'package:flutter/material.dart';
import 'package:flutter_app/components/already_have_an_account_acheck.dart';
import 'package:flutter_app/components/rounded_button.dart';
import 'package:flutter_app/components/rounded_input_field.dart';
import 'package:flutter_app/components/rounded_password_field.dart';
import 'package:flutter_app/components/widgets.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/screens/BottomTabs/bottom_tabs_nav.dart';
import 'package:flutter_app/screens/SignUp/sign_up.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.04),
            Image(image:const AssetImage( "assets/images/login_img.png"),
            height: MediaQuery.of(context).size.height /3,
            width: MediaQuery.of(context).size.width/2,
            fit: BoxFit.contain,
          ),
            const Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.015),
            const Text(
              "Log in to your existent account of flutter app",
              style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: size.height * 0.05),
            RoundedInputField(
              hintText: "Your Email",
              labelText: "Email",
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.025),
            RoundedPasswordField(
              hint: "Password",
              onChanged: (value) {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 8.0, 25.0, 8.0),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500,),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomTabsNav(),
                    )
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            const Text(
              "Or connect using",
              style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400,),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100.0, 20.0, 100.0, 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomWidgets.socialButtonCircle(
                      facebookColor, FontAwesomeIcons.facebookF,
                      iconColor: Colors.white, onTap: () {
                    Fluttertoast.showToast(msg: 'I am circle facebook');
                  }),
                  CustomWidgets.socialButtonCircle(
                      googleColor, FontAwesomeIcons.googlePlusG,
                      iconColor: Colors.white, onTap: () {
                    Fluttertoast.showToast(msg: 'I am circle google');
                  }),
                ],
              ),
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.02),
          ],
        ),
    );
  }
}
