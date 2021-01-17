import 'package:WeeklyExpenseApp/widgets/chart.dart';
import 'package:WeeklyExpenseApp/widgets/new_transaction.dart';
import 'package:WeeklyExpenseApp/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weekly Expenses',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'OpenSans',
      ),

    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransactions = [
    /*Transaction(
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
    )*/
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((transaction) {
        return transaction.date.isAfter(
            DateTime.now().subtract(
              Duration(days: 7),
            ),
        );
      }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: chosenDate,
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
        return GestureDetector( // Useless but used it for learning
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransaction),
        );
    });
  }

  void _removeTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Expense App'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView( // For Input Responsiveness
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Chart(_recentTransactions),
            ),
            Transactionlist(_userTransactions, _removeTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
        splashColor: Colors.white,
      ),
    );
  }
}
