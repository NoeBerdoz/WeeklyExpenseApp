import 'package:WeeklyExpenseApp/models/transaction.dart';
import 'package:WeeklyExpenseApp/widgets/new_transaction.dart';
import 'package:WeeklyExpenseApp/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 199.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Food',
      amount: 100,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        Transactionlist(_userTransaction),
      ],
    );
  }
}
