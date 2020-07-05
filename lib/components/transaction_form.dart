import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (_) =>
                  _submitForm(), // _ underline dentro do parâmetro significa que não iremos usar o parâmetro
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              onSubmitted: (_) =>
                  _submitForm(), // _ underline dentro do parâmetro significa que não iremos usar o parâmetro
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: valueController,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  textColor: Colors.purple,
                  child: Text('Nova transação'),
                  onPressed: _submitForm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
