import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_mad/screens/login.dart';
import 'package:project_mad/screens/widgets/changescreen.dart';
import 'package:project_mad/screens/widgets/mybutton.dart';
import 'package:project_mad/screens/widgets/mytextformfield.dart';
import 'package:project_mad/screens/widgets/passwordtextformfield.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();


String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;
String email;
String password;

class _SignUpState extends State<SignUp> {
  void validation() async {
    final FormState _form = _formkey.currentState;
    if (!_form.validate()) {
      try{
        AuthResult result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
        print(result.user.uid);
      }on PlatformException catch (e) {
        print(e.message.toString());
        _scaffoldkey.currentState.showSnackBar(
          SnackBar(
            content: Text(e.message),
          ),
          );
      }
    }
    else{
    }
  }

  Widget _buildAllTextFormField() {
    return Container(
      height: 330,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MyTextFormField(
            name: "UserName",
            validator: (value) {
              if (value == "") {
                return "Please Fill In Username";
              } else if (value.length < 6) {
                return "Username Is Too Short";
              }
              return "";
            },
          ),
          MyTextFormField(
            name: "Email",
            onChanged: (value) {
              setState(() {
               email = value;
               print(email);
              });
            },
            validator: (value) {
              if (value == "") {
                return "Please Fill In Email";
              } else if (!regExp.hasMatch(value)) {
                return "Email Is Invalid";
              }
              return "";
            },
          ),
          PasswordTextFormField(
            obserText: obserText,
            name: "Password",
            onChanged: (value) {
              setState(() {
                password = value;
                print(password);
              });
            },
            validator: (value) {
              if (value == "") {
                return "Please Fill In Password";
              } else if (value.length < 8) {
                return "Password Is To Short";
              }
              return "";
            },
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obserText = !obserText;
              });
            },
          ),
          MyTextFormField(
            name: "Phone Number",
            validator: (value) {
              if (value == "") {
                return "Please Fill In Phone Number";
              } else if (value.length < 8) {
                return "Phone Number Must Be 8 Digit";
              }
              return "";
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      height: 400,
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildAllTextFormField(),
          MyButton(
            name: "SignUp",
            onPressed: () {
              validation();
            },
          ),
          ChangeScreen(
            name: "Login",
            whichAccount: "I Have An Account Already",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => Login(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _buildBottomPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
