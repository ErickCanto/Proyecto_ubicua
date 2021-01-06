import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                              height: MediaQuery. of(context). size. height - 129,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index)
                                  {
                                    return
                                      Column(
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.center,
                                          child: Column(children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(8, 6, 8, 3),
                                                child:  Text(snapshot.data[index].data()["usuario"],textAlign: TextAlign.left, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                              )
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                                              child:  Text(snapshot.data[index].data()["descripcion"],textAlign: TextAlign.center),
                                            )

                                            ]
                                          ),
                                          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                                          decoration: new BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:BorderRadius.circular(7),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0, 3), // changes position of shadow
                                              ),
                                            ],
                                          ),

                                        )
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
              child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      child: Image.asset("lib/assets/images/Erick.jpeg",width: 200, height: 200),
                    ),
                    Container(
                      //width: 200,
                      height: 200,
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Colors.black.withAlpha(0),
                                Colors.black12,
                                Colors.black45,
                              ]
                          )
                      ),
                      child: Text("Toth (Usuario)", style: TextStyle(fontSize: 20,color: Colors.white)),
                    )
                  ]
              ),
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
  QuerySnapshot q = await databaseReference2.collection('publicacion').get();
  return q.docs;
}