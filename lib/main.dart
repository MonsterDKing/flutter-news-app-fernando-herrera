import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/tabspage.dart';
import 'package:newsapp/src/theme/tema.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: TabsPage(),
      theme: miTema,
    );
  }
}