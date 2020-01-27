import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      home: Scaffold(
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
