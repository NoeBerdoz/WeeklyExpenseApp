import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime _selectDate;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    final enteredDate = _selectDate;

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectDate == null) {
      return; // If it returns, the addTransaction won't be reached.
    }

    widget.addTransaction(
      enteredTitle,
      enteredAmount,
      enteredDate,
    );
    // Close new_transaction form view
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now()
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'Title'
              ),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(
                  decimal: true
              ),
              decoration: InputDecoration(
                  labelText: 'Amount'
              ),
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 70,
              child: Row(children: <Widget>[
                Expanded(
                  child: Text(_selectDate == null
                      ? 'Aucune date sélectionnée'
                      : 'Date : ' + DateFormat.yMd().format(_selectDate)
                  ),
                ),
                FlatButton(
                    onPressed: _presentDatePicker,
                    child: Text('Choisir une date', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),),
                )
              ],
              ),
            ),
            RaisedButton(
              onPressed: submitData,
              child: Text('Ajouter une dépense'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
