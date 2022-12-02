import 'package:expenseplanner/models/transaction.dart';
import 'package:expenseplanner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
TransactionList(this.transactions);



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty?Column(
        children: [
          Text("No Transactions are not add yet"),
          Container(
              height: 200,
              child: Image.asset('assets/images/f.jpg',fit: BoxFit.cover))
        ],
      ) :ListView.builder(
        itemCount: transactions.length ,
        itemBuilder: (ctx , index){
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
                    '\$' + transactions[index].amount.toStringAsFixed(2),
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight
                        .bold),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(DateFormat().format(transactions[index].date)),
                ],
              )
            ],
          ),
        );
      },

      ),
    );
  }
}
