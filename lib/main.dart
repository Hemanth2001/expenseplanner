import 'package:expenseplanner/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blueGrey)
            .copyWith(
            secondary: Colors.amber),
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(subtitle1:TextStyle(
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.bold,
          fontSize: 18,
        )),
        appBarTheme: AppBarTheme(
           titleTextStyle: TextStyle(
             fontFamily: 'OpenSans',
             fontSize: 20,
             fontWeight: FontWeight.bold
           ) 
        )),


      home: Home(),

    );
  }
}
