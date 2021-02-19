import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_mad/screens/signup.dart';
import 'package:project_mad/screens/widgets/changescreen.dart';
import 'package:project_mad/screens/widgets/mytextformfield.dart';
import 'package:project_mad/screens/widgets/passwordtextformfield.dart';
import '../screens/widgets/mybutton.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
String eamil;
String password;
final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
void validation() async{
  final FormState _form = _formkey.currentState;
  if (!_form.validate()) {
    try{
      AuthResult result = await FirebaseAuth.instance
    .signInWithEmailAndPassword(email: email, password: password);
    print(result.user.uid);
    }on PlatformException catch (e){
      _scaffoldkey.currentState.showSnackBar(
        SnackBar(
          content: Text(e.message),
        ),
      );
    }
  } else {
    print("NO");
  }
}

bool oberText = true;

class _LoginState extends State<Login> {
  Widget _buildAllPart() {
    return Container(
      height: 500,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Login",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
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
            onChanged: (value) {
              setState(() {
               password = value;
              });
            },
            name: "Password",
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
          MyButton(
            onPressed: () {
              validation();
            },
            name: "Login",
          ),
          ChangeScreen(
            name: "SignUp",
            whichAccount: "I Don't Have An Account",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => SignUp(),
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
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              _buildAllPart(),
            ],
          ),
        ),
      ),
    );
  }
}
