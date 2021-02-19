import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage("images/"))),
            ),
            Text(
              "Welcome",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Container(
              height: 60,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Ready To Start Shopping Sign Up",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "To Get Started",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 45,
                  width: double.infinity,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      color: Color(0xff),
                      onPressed: () {}),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Already Have An Account?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
