import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_ubicua/ObjetosdeFeed.dart';
import 'package:intl/intl.dart';

final databaseReference = Firestore.instance;

class Feed extends StatefulWidget{
    @override
    States createState()=> States();
    //throw UnimplementedError();
}
final databaseReference2 = Firestore.instance;
class States extends State<Feed>
{
  final searchcontroller = new TextEditingController();
  final databaseReference = FirebaseFirestore.instance;
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

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
          Column(
            children: <Widget>[
              Container(
                child: FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot)
                  {
                    if(snapshot.connectionState == ConnectionState.waiting)
                      return Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Column(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 6, 8, 3),
                                child:  Text("Cargando",textAlign: TextAlign.center, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                              )
                            ]
                            )

                        ),
                      ]);
                    else
                      {
                        return ListView(
                          shrinkWrap: true,
                          children: [
                              SizedBox(
                              height: MediaQuery. of(context). size. height - 145,
                              child: ListView.builder(

                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index)
                                  {
                                    return
                                      Column(
                                      children: <Widget>[
                                        ObjetoTexto(
                                            publicador: snapshot.data[index].data()["usuario"],
                                            imagenpublicador: "lib/assets/images/Toth.png",
                                            text: snapshot.data[index].data()["descripcion"],
                                            date: formatter.format(snapshot.data[index].data()["fecha"].toDate()),
                                        ),
                                      ],
                                    );
                                  }
                              ),
                            ),
                          ],
                        );
                      }
                  },
                ),
              ),
              FloatingActionButton(
                onPressed: () => Navigator.pushNamed(context, '/pubCreate'),
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
            ]
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

Future getData() async
{
  QuerySnapshot q = await databaseReference.collection('publicacion').get();
  return q.docs;
}