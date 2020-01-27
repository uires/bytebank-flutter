import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      home: Scaffold(
        body: Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('100,00'),
            subtitle: Text('9901-9'),
          )
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
