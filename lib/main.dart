import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_mad/provider/category_provider.dart';
import 'package:project_mad/provider/product_provider.dart';
import 'package:project_mad/screens/homepage.dart';
import 'package:project_mad/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<ProductProvider>(
          create: (ctx) => ProductProvider(),
        ),
        ListenableProvider<CategoryProvider>(
          create: (ctx) => CategoryProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (ctx, snapShot) {
              if (snapShot.hasData) {
                return HomePage();
              } else {
                return Login();
              }
            }),
      ),
    );
  }
}
