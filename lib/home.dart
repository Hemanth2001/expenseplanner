import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Planner"),
      ),
      body: Column(
        children: [
          Card(
            child: Container(
                width: double.infinity,
                color: Colors.amberAccent ,
                child: Text("Chart")),
            elevation: 5,
          ),
          Card(
            child: Text("list"),
          )
        ],
      ),
    );
  }
}
