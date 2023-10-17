import 'package:flutter/material.dart';
import 'package:flutter_webapp/homepage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      home: HomePage(),
      theme: ThemeData(useMaterial3: false,colorSchemeSeed: Colors.black)
    );
  }
}


