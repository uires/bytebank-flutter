import 'package:bytebank/components/editor.dart';
import 'package:flutter/material.dart';

import 'formulario_transferencia.dart';

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _numeroContaoController = TextEditingController();

  _criarTransferencia(BuildContext context) {
    final int numero = int.tryParse(_numeroContaoController.text);
    final double valor = double.tryParse(_valorController.text);
    if (numero != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numero);
      Navigator.pop(context, transferenciaCriada);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Transferência"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: this._numeroContaoController,
                rotulo: 'Número da Conta',
                dica: '0000'),
            Editor(
                controlador: this._valorController,
                rotulo: 'Valor',
                dica: '0.0',
                icone: Icons.monetization_on),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () => _criarTransferencia(context),
            )
          ],
        ),
      ),
    );
  }
}
