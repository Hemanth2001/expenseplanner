import 'package:expenseplanner/models/transaction.dart';
import 'package:expenseplanner/widgets/new_transaction.dart';
import 'package:expenseplanner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      //  NewTransaction(_addNewTransaction),
       // TransactionList(_userTransaction),
      ],

    );
  }
}
