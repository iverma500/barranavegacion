import 'package:flutter/material.dart';

import 'pages/HomePage.dart';
import 'pages/UserPage.dart';

void main() => runApp(MiApp());

class MiApp extends StatefulWidget{

  @override
  State<MiApp> createState() => _MiAppState();
}

class _MiAppState extends State<MiApp> {

  @override
  Widget build(BuildContext context) {
    String title = "Mi app Navigation Bar";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Inicio(title: title,), //widget custom
    ); //patrón de diseño
  }
}

class Inicio extends StatefulWidget{
  Inicio({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  int actualPage = 0;

  List<Widget> pages = [
    HomePage(),
    UserPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.title??""),
      ),
      body: pages[actualPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            actualPage = index;
          });
        },
        currentIndex: actualPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle), label: "Users")
        ],
      ),
    );
  }
}