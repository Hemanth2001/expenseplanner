import 'package:expenseplanner/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class NewTransaction extends StatefulWidget {

  final Function addTx;


  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final title = TextEditingController();

  final amount= TextEditingController();

    void submitData()
    {
      final enteredTitle = title.text;
      final enteredAmount= double.parse( amount.text);
      if(enteredTitle.isEmpty || enteredAmount<=0) {
        return;
      }

      widget.addTx(enteredTitle, enteredAmount);
      Navigator.of(context).pop();

    }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: title,
                decoration: InputDecoration(labelText: 'Title'),
                onSubmitted: (_)=>submitData,
              ),
              TextField(
                controller: amount,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onSubmitted: (_)=>submitData,
              ),
              ElevatedButton(onPressed:submitData,
                  child: Text
          ('Add')),
            ],
          ),
        ));

  }
}
