import 'package:expenseplanner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:expenseplanner/models/transaction.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> transaction = [
    Transaction(id: "1", title: "Food", amount: 5000, date: DateTime.now()),
    Transaction(id: "12", title: "Food", amount: 5000, date: DateTime.now()),
    Transaction(id: "13", title: "Food", amount: 5000, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Planner"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              color: Colors.amberAccent,
              child: Text("Chart"),
              elevation: 5,
            ),
          ),
          TransactionList()
        ],
      ),
    );
  }
}
