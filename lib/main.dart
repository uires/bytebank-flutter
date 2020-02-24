import 'dart:ffi';

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

  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _numeroContaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Transferência"),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controlador: this._numeroContaoController, 
            rotulo: 'Número da Conta', 
            dica: '0000'
          ),
          Editor(
            controlador: this._valorController,
            rotulo: 'Valor', 
            dica: '0.0', 
            icone:Icons.monetization_on
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () => _criarTransferencia(context),
          )
        ],
      ),
    );
  }

  _criarTransferencia(BuildContext context) {

    final int numero = int.tryParse(_numeroContaoController.text);
    final double valor = double.tryParse(_valorController.text);
    if(numero != null && valor != null) {

      final transferenciaCriada = Transferencia(valor, numero);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: this.controlador,
        style: TextStyle(
          fontSize: 24.0
        ),
        decoration: InputDecoration(
          icon: this.icone != null ? Icon(this.icone) : null ,
          labelText: this.rotulo,
          hintText: this.dica
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  
  final List<Transferencia> _transferencias = List();

  @override
  Widget build(BuildContext context) {

   return Scaffold(
        body: ListView.builder(
          itemCount: this._transferencias.length,
          itemBuilder: (context, indice) {
            final transferencia = this._transferencias[indice];
            return ItemTransferencia(transferencia);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {

            final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                  return FormularioTransferencia();
                } 
              )
            );
            future.then((transferenciaRecebida) {
              debugPrint('$transferenciaRecebida');
              this._transferencias.add(transferenciaRecebida);
            });
          },
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