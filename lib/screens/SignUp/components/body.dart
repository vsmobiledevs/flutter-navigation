import 'package:flutter/material.dart';
import 'package:flutter_app/components/already_have_an_account_acheck.dart';
import 'package:flutter_app/components/rounded_button.dart';
import 'package:flutter_app/components/rounded_input_field.dart';
import 'package:flutter_app/components/rounded_password_field.dart';
import 'package:flutter_app/screens/Login/login.dart';

class Body extends StatefulWidget {
  const Body ({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BodyState();
  }
}

class BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    String name = "";
    String email = "";
    String phone = "";
    String pass = "";
    String cPass = "";

    Size size = MediaQuery.of(context).size;
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

    void _goBack(context) {
      Navigator.of(context).pop();
    }

    void _showErrorDialog(context, msg){
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            // Retrieve the text which the user has entered by
            // using the TextEditingController.
            content: Text(msg),
            actions: <Widget>[
              FlatButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }

    void _validateData(context) {
      var emptyFields = "Kindly fill all the fields to proceed further.";
      var invalidEmail = "Kindly enter the valid email address.";
      var passNotEqual = "Passwords are mismatched.";
      var allGood = "Your account has been created successfully.";

      print('Name is ==> ' + name);
      if(name == "" || email == "" || phone == "" || pass == "" || cPass == "" ){
        _showErrorDialog(context, emptyFields);
      }else{
        if(!emailValid){
          _showErrorDialog(context, invalidEmail);
        }else{
          if(pass != cPass){
            _showErrorDialog(context, passNotEqual);
          }else{
            _showErrorDialog(context, allGood);
          }
        }
      }
    }

    return  SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.03),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                    iconSize: 25,
                    color: Colors.blue,
                    splashColor: Colors.white,
                    onPressed: (){_goBack(context);}
                ),
              ),
              const Text(
                "Register Yourself!",
                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Image(image:const AssetImage( "assets/images/login_img.png"),
            height: MediaQuery.of(context).size.height /3,
            width: MediaQuery.of(context).size.width/2,
            fit: BoxFit.contain,
          ),
          SizedBox(height: size.height * 0.02),
          RoundedInputField(
            hintText: "Enter Name",
            labelText: "Name",
            onChanged: (value) {
              setState(() { name = value; });
            },
            icon: Icons.person,
          ),
          SizedBox(height: size.height * 0.025),
          RoundedInputField(
            hintText: "Enter Email",
            labelText: "Email",
            onChanged: (value) {
            setState(() { email = value; });
          },
            icon: Icons.email,
          ),
          SizedBox(height: size.height * 0.025),
          RoundedInputField(
            hintText: "Enter Phone",
            labelText: "Phone",
            onChanged: (value) {
            setState(() { phone = value; });
          },
            icon: Icons.phone,
          ),
          SizedBox(height: size.height * 0.025),
          RoundedPasswordField(
            hint: "Password",
            onChanged: (value) {
              setState(() { pass = value; });
            },
          ),
          SizedBox(height: size.height * 0.025),
          RoundedPasswordField(
            hint: "Confirm Password",
            onChanged: (value) {
            setState(() { cPass = value; });
          },
          ),
          SizedBox(height: size.height * 0.02),
          RoundedButton(
            text: "SIGN UP",
            press: () {
              // _validateData(context);
            },
          ),
          SizedBox(height: size.height * 0.03),
          AlreadyHaveAnAccountCheck(
            login:false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
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
