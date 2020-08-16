import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  //  Renderizando dinamicamente a altura do Widget com MediaQuery, Container removido
  //   height: MediaQuery.of(context).size.height * 0.53,

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  //Definindo espaçamento entre componentes com SizedBox
                  const SizedBox(height: 20),
                  Text(
                    'Nenhuma transação cadastrada!',
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.title,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            //ListView.builder cria os componentes conforme necessário, para não sobrecarrecar a memória do celular
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final e = transactions[index];
              return TransactionItem(
                key: GlobalObjectKey(e),
                e: e,
                onRemove: onRemove,
              );
            },
          );
    // : ListView(
    //     children: transactions.map((e) {
    //       return TransactionItem(
    //         key: ValueKey(e.id),
    //         e: e,
    //         onRemove: onRemove,
    //       );
    //     }).toList(),
    //   );
  }
}
