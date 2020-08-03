import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/tabspage.dart';
import 'package:newsapp/src/services/NewsService.dart';
import 'package:newsapp/src/theme/tema.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> new NewService(),)
        ],
        child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: TabsPage(),
        theme: miTema,
      ),
    );
  }
}