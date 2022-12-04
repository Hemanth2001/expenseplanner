import 'dart:ffi';

import 'package:expenseplanner/models/transaction.dart';
import 'package:expenseplanner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return widget.transactions.isEmpty
        ? Column(
            children: [
              Text("No Transactions are not add yet"),
              Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset('assets/images/f.jpg', fit: BoxFit.cover))
            ],
          )
        : ListView.builder(
            itemCount: widget.transactions.length,
            itemBuilder: (ctx, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '\$' +
                              widget.transactions[index].amount
                                  .toStringAsFixed(2),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    widget.transactions[index].title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  subtitle: Text(
                      DateFormat().format(widget.transactions[index].date)),
                  trailing: IconButton(
                    onPressed: () =>
                        widget.deleteTx(widget.transactions[index].id),
                    icon: Icon(Icons.delete),
                  ),
                ),
              );
            });
  }
}
