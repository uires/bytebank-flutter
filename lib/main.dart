import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(children: <Widget>[
            ItemTransferencia(Transferencia(100.00, 991)),
            ItemTransferencia(Transferencia(1189.00, 996)),
            ItemTransferencia(Transferencia(1500.99, 997))
          ]
        ),
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _print(),
        ),
      ),
    )
  );

  _print() {

    print('método para tirar warning do flutter');
  }


class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {

    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(this._transferencia.valor.toString()),
          subtitle: Text(this._transferencia.numeroConta.toString()),
        )
      );
  }
}

class Transferencia {

  final double valor;
  final int numeroConta;
  
  Transferencia(this.valor, this.numeroConta);
}