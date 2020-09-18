import 'package:flutter/material.dart';

import 'screens/HomePage_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFFE3FF0B),
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black)),
          appBarTheme: AppBarTheme(
              // color: Colors.grey[100],
              centerTitle: true,
              elevation: 0,
              brightness: Brightness.light,
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'Quattrocento Sans',
                      fontSize: 30,
                      color: Colors.black)))),
      home: MyHomePage(),
      routes: {},
    );
  }
}
