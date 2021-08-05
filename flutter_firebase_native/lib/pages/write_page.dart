import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class WritePage extends StatefulWidget {
  WritePage({Key? key}) : super(key: key);

  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  Color Color1 = Colors.green[800]!;
  Color Color2 = Colors.green[600]!;

  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();

  late String nombre;
  late String email;

  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _formPersonasUI(),
    );
  }

  Widget _formPersonasUI(){
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
              Color1,
              Color2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 68.0, horizontal: 24.0
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Registrar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46.0,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _nombreController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: Color(0xFFe7edeb),
                          hintText: "Nombre",
                          prefixIcon:Icon(
                            Icons.face,
                            color: Colors.grey[600],
                          ) 
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: Color(0xFFe7edeb),
                          hintText: "E-mail",
                          prefixIcon:Icon(
                            Icons.email,
                            color: Colors.grey[600],
                          ) 
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _getData,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              "Enviar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _getData(){
    setState(() {
      nombre = _nombreController.text;
      email = _emailController.text;
      _postData(nombre,email);
    });
  }
  void _postData(String name, String email) async{
    try{
      var url = Uri.parse("https://login-fltter-default-rtdb.firebaseio.com/Agenda.json");

      Map data = {'nombre':name, 'email':email};

      final response = await http.post(url, body: json.encode(data));

      if(response.statusCode == 200){
        _nombreController.clear();
        _emailController.clear();
        Fluttertoast.showToast(msg: 'Se enviaron los datos correctamente',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white);
      }
      else{
        Fluttertoast.showToast(msg: 'Surgio un error al enviar datos',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white);
      }
    }catch(e){
      print(e.toString());
    }
  }
}