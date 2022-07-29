import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ino_fluter/providers/project_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewTimeline extends StatefulWidget {
  final add;
  final index;

  NewTimeline(this.add,this.index);

  @override
  _NewTimelineState createState() => _NewTimelineState();
}

class _NewTimelineState extends State<NewTimeline> {
  final _descController = TextEditingController();
  var _selectedDate;

  void _submitData() {
    final enteredDesc = _descController.text;

    if (enteredDesc.isEmpty || _selectedDate == null) {
      return;
    }
    widget.add(enteredDesc, _selectedDate, widget.index);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Description'),
              controller: _descController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: const Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              // textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
              child: const Text('Add Project'),
            ),
          ],
        ),
      ),
    );
  }
}
