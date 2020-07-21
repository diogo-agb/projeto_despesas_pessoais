import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  ChartBar({
    this.label,
    this.value,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          // Reduz o Tamnaho até caber no espaço especificado
          child: Text('${value.toStringAsFixed(2)}'),
        ),
        SizedBox(height: 5), // Sizedbox para dar espaço
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            // Stack permite colocar um componente em cima do outro
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 5), // Sizedbox para dar espaço
        Text(label),
      ],
    );
  }
}
