import 'package:bytebank/components/item_transferencia.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/formulario_transferencia/formulario_transferencia.dart';
import 'package:flutter/material.dart';

import 'lista_transferencia.dart';

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            Future.delayed(Duration(seconds: 1), () {
              if (transferenciaRecebida != null) {
                setState(() {
                  widget._transferencias.add(transferenciaRecebida);
                });
              }
            });
          });
        },
      ),
      appBar: AppBar(
        title: Text('Transferências'),
      ),
    );
  }
}
