import 'package:flutter/foundation.dart'; // Pare ter acesso ao @required (Forçar requerido)

class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.value,
    @required this.date,
  });
}
