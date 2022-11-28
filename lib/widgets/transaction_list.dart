import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _usertransaction = [
    Transaction(id: "1", title: "Food", amount: 5000, date: DateTime.now()),
    Transaction(id: "12", title: "Food", amount: 5000, date: DateTime.now()),
    Transaction(id: "13", title: "Food", amount: 5000, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return           Column(
      children: _usertransaction.map((tx) {
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
    );
  }
}
