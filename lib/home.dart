import 'package:flutter/material.dart';
import 'package:expenseplanner/transaction.dart';
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
          Card(
            child: Column(children: [
              TextField(),
              TextField()

            ],
          )

          ),
          Column(
            children: transaction.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        )),
                        child: Text(
                          '\$' + tx.amount.toString(),
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight
                              .bold),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight
                              .bold),
                        ),
                        Text(DateFormat().format(tx.date)),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
