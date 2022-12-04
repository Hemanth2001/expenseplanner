import 'package:expenseplanner/models/transaction.dart';
import 'package:expenseplanner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
TransactionList(this.transactions,this.deleteTx);




  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 300,
      height: MediaQuery.of(context).size.height*0.6,
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
          child:
              ListTile(
              leading:CircleAvatar(radius: 40,
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '\$' + transactions[index].amount.toStringAsFixed(2),
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight
                                .bold),
                          ),
                        ),
                      ),
                    ),
                title:
                      Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),

                   subtitle:   Text(DateFormat().format(transactions[index]
                       .date)
                      ),
                trailing:IconButton(onPressed: ()=>deleteTx(transactions[index].id),
                    icon: Icon(Icons.delete),) ,
              ),


        );    }
      ),
    );
  }
}
