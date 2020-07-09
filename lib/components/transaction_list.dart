import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // Assim como o SingleChildScrollView o ListView precisa de um tamanho definido no componente pai
      child: ListView.builder(
        //ListView.builder cria os componentes conforme necessário, para não sobrecarrecar a memória do celular
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final e = transactions[index];
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      //color: Colors.green,
                      //Pegando a cor padrão do tema
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text(
                    'R\$ ${e.value.toStringAsFixed(2)}', // Exibindo com duas casas decimais
                    // se já estiver no contexto de string não precisa chamar o e.value.toString
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      //color: Colors.green,
                      //Pegando a cor padrão do tema
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      e.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      // Adicionando estilo para a data com pacote intl
                      DateFormat('d MMM y').format(e.date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
