import 'package:expenseplanner/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:core';

import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {

  final Function addTx;


  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final title = TextEditingController();
  final amount= TextEditingController();
  DateTime? _selectedDate;

    void submitData()
    {
      final enteredTitle = title.text;
      final enteredAmount= double.parse( amount.text);
      if(enteredTitle.isEmpty || enteredAmount<=0||_selectedDate==null) {
        return;
      }

      widget.addTx(enteredTitle, enteredAmount,_selectedDate);
      Navigator.of(context).pop();

    }
    void presentDatePicker(){
      showDatePicker(context: context, initialDate: DateTime.now(), firstDate:
      DateTime(2019), lastDate: DateTime.now()).then((pickeredDate){
        if (pickeredDate==null)
          {
           return;
           }
        setState((){
          _selectedDate=pickeredDate;
        });
      });
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
              Row(children: [
                Expanded(
                  child: Text(
                    _selectedDate == null ? 'No Date chosen': DateFormat.yMd().format
                      (_selectedDate!),),
                ),
                FlatButton(onPressed: (){
                  presentDatePicker();
                }, child: Text('Choose Date '))
              ],),
              ElevatedButton(onPressed:submitData,
                  child: Text
          ('Add')),
            ],
          ),
        ));

  }
}
