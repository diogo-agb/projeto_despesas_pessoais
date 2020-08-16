import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction e;
  final void Function(String p1) onRemove;

  const TransactionItem({
    Key key,
    @required this.e,
    @required this.onRemove,
  }) : super(key: key);

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.black,
  ];

  Color _backgroundcolor;

  @override
  void initState() {
    super.initState();
    int i = Random().nextInt(5);
    _backgroundcolor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundcolor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('R\$${widget.e.value}'),
            ),
          ),
        ),
        title: Text(
          widget.e.title,
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(widget.e.date),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                onPressed: () => widget.onRemove(widget.e.id),
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                onPressed: () => widget.onRemove(widget.e.id),
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
