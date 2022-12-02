import 'package:expenseplanner/widgets/chart.dart';
import 'package:expenseplanner/widgets/new_transaction.dart';
import 'package:expenseplanner/widgets/transaction_list.dart';
import 'package:expenseplanner/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import 'package:expenseplanner/models/transaction.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Transaction> _userTransaction = [
    // Transaction(id: "1", title: "Food", amount: 5000, date: DateTime.now()),
    // Transaction(id: "12", title: "Food", amount: 5000, date: DateTime.now()),
    // Transaction(id: "13", title: "Food", amount: 5000, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions{
    return _userTransaction.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(Duration(days:7 ),),);
    }).toList();
  }
  void _addNewTransaction(String txTitle, double txAmount,DateTime chosenDate)
  {
    final newTx=Transaction( title: txTitle, amount: txAmount, date:chosenDate, id:
    DateTime.now().toString());

    setState((){
      _userTransaction.add(newTx);
      print(_userTransaction);

    }

    );
  }


  void startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return  GestureDetector(onTap: (){},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,

      );
    },);
  }
  void _deleteTransaction(String id){
    setState((){
      _userTransaction.remove((tx)=> tx.id==id
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Planner"),
        actions: [
          IconButton(onPressed: (){
            startAddNewTransaction(context);
          }, icon: Icon(Icons.add),),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //
            Chart(_recentTransactions),
           TransactionList(_userTransaction,_deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(onPressed:(){
        startAddNewTransaction(context);}, child:Icon
        (Icons.add)),
    );
  }
}
