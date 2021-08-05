import 'package:flutter/material.dart';
import 'package:flutter_firebase_native/pages/login_page.dart';
import 'package:flutter_firebase_native/pages/read_page.dart';
import 'package:flutter_firebase_native/pages/write_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'read': (BuildContext context) => ReadPage(),
        'write':(BuildContext context) => WritePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}