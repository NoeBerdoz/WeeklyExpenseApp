import 'package:WeeklyExpenseApp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transactionlist extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  Transactionlist(this.transactions, this.removeTransaction);

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
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                            child: Text('${transactions[index].amount} .-')
                        )
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date)
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    color: Theme.of(context).errorColor,
                    onPressed: () => removeTransaction(transactions[index].id),
                  ),

                ),
              );
            },
            itemCount: transactions.length,
        ),
    );
  }
}
