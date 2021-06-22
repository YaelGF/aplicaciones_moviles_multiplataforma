import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.calculate_outlined),
        onPressed: (){
          Navigator.pushNamed(context, 'operaciones');
        }, 
        label: Text("Calculadora")),
        
    );
  }
}