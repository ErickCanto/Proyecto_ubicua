import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Feed extends StatefulWidget{
    @override
    States createState()=> States();
    //throw UnimplementedError();

}

class States extends State<Feed>
{
  final searchcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            titleSpacing: 0,
            automaticallyImplyLeading: true,
            actions: [
              SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: TextField(controller: searchcontroller)
              ),
              IconButton(icon: Icon(Icons.search), onPressed: (){},iconSize: 20,)
            ]
        ),
      body:
        Container(
          child: ListView(
            children: [],
          )
        ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Categorias'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Perfil'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              title: Text('Ayuda'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}