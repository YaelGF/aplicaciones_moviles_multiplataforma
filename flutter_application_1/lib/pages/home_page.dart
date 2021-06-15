import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 10;
  void _incrementCounter() {
    setState(() {
      _count += 2;
    });
  }
  void _decrementCounter() {
    setState(() {
      _count -= 3;
    });
  }
  void _resetCounter(){
    setState(() {
      _count = 10;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Incremento y Decremento'),
      ),
      body: Center(child: Text('El valor inicial es $_count tiempos.')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Incremento',
            child: Icon(Icons.add_circle),
          ),
          SizedBox(
            height: 15.0,
          ),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decremento',
            child: Icon(Icons.remove_circle),
          ),
          SizedBox(
            height: 15.0,
          ),
          FloatingActionButton(
            onPressed: _resetCounter,
            tooltip: 'Reseteo',
            child: Icon(Icons.repeat),
          ),
        ],
      ),
    );
  }
}