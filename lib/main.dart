import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return Container();
  }
}

class ListaTransferencia extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

   return Scaffold(
        body: Column(
          children: <Widget>[
            ItemTransferencia(Transferencia(100.00, 991)),
            ItemTransferencia(Transferencia(1189.00, 996)),
            ItemTransferencia(Transferencia(1500.99, 997))
          ]
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add)
        ),
        appBar: AppBar(
          title: Text('Transferências'),
        ),
    );
  }
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