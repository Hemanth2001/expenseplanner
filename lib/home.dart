import 'package:flutter/material.dart';
import 'package:expenseplanner/transaction.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Transaction> transaction=[
    Transaction(id: "1",
    title: "Food",
  amount: 5000,
    date:DateTime.now()
  ]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Planner"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
