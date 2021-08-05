import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ReadPage extends StatefulWidget {
  ReadPage({Key? key}) : super(key: key);

  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  void initState(){
    super.initState();
    readData();
  }
  List<Map<String, dynamic>> list = [];
  bool reading = true;

  Future<void> readData() async{
    try{
      var url = Uri.parse("https://login-fltter-default-rtdb.firebaseio.com/Agenda.json");
      final response = await http.get(url);
      final data = json.decode(response.body) as Map<String, dynamic>;
      list.clear();
      data.forEach((key, value) {//sacar las keys y valores de un mapa
        /*list.add(value['nombre']);
        list.add(value['email']);*/
        list.add({"nombre":value['nombre'], "email":value['email']});
      });
      setState(() {
        reading = false;
      });
    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Datos"),
        centerTitle: true,
      ),
      body: table(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: ()=>{
              Navigator.pushNamed(context, 'write')
            },
            tooltip: 'Agregar',
            child: Icon(Icons.add)
          ),
          SizedBox(
            height: 15.0,
          ),
          FloatingActionButton(
            onPressed: ()=>{
              readData()
            },
            tooltip: 'Readload',
            child: Icon(Icons.update)
          ),
        ],
      )
        
    );
  }
  Widget table(){
    return ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(horizontal:10),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: DataTable(
            columns: [
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Email')),
            ],
            rows:
                list // Loops through dataColumnText, each iteration assigning the value to element
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(Text(element["nombre"])), //Extracting from Map element the value
                              DataCell(Text(element["email"])),
                            ],
                          )),
                    )
                    .toList(),
            )
        )
      ],
    );
  }
}