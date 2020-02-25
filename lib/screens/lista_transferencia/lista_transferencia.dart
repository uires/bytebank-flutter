import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'lista_transferencia_state.dart';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}