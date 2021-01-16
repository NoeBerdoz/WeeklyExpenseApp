import 'package:WeeklyExpenseApp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transactionlist extends StatelessWidget {
  final List<Transaction> transactions;

  Transactionlist(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(children: transactions.map((tx) {
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
                        color: Colors.blueGrey, width: 2
                    )
                ),
                child: Text(
                  '\$${tx.amount}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blueGrey
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tx.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                  Text(
                    DateFormat.MMMMEEEEd().format(tx.date),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          )
      );
    }).toList()
    );
  }
}
