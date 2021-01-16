import 'package:WeeklyExpenseApp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transactionlist extends StatelessWidget {
  final List<Transaction> transactions;

  Transactionlist(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380, // TODO make it responsive
        child: transactions.isEmpty ? Column(children: <Widget>[
          Text(
            'Aucune dépense ajoutée.',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox( // Invisible Separator
            height: 20,
          ),
          Container(
              height: 200,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              )
          )

        ],) : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2
                            )
                        ),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColorDark
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                          ),
                          Text(
                            DateFormat.MMMMEEEEd().format(transactions[index].date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  )
              );
            },
            itemCount: transactions.length,
        ),
    );
  }
}
