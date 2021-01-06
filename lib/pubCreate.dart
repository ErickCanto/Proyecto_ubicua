import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final databaseReference = Firestore.instance;

class pubCreate extends StatelessWidget{

  final categoria = TextEditingController();
  final descripcion = TextEditingController();
  final usuario = TextEditingController();

  @override dispose()
  {

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        body:
        Center(
            child: Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.95,
                child: ListView(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.fromLTRB(15,100,15,15),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  Text("¡Comparte tu arte!", style: TextStyle(color: Colors.grey,fontSize: 16))
                                    ]
                                )
                            ),

                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextField(controller: categoria,decoration: InputDecoration(hintText: 'Categoria')),
                                      Container(
                                          child: Text('¿A dónde crees que pertenece tu publicación?', style: TextStyle(color: Colors.grey,fontSize: 16),)
                                      )
                                    ]
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextField(controller: descripcion,decoration: InputDecoration(hintText: 'Descripción')),
                                      Container(
                                          child: Text('¿De qué trata?', style: TextStyle(color: Colors.grey,fontSize: 16),)
                                      )
                                    ]
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextField(controller: usuario,decoration: InputDecoration(hintText: 'Usuario')),
                                      Container(
                                          child: Text('Dinos como ubicarte', style: TextStyle(color: Colors.grey,fontSize: 16),)
                                      )
                                    ]
                                )
                            ),
                            SizedBox(
                                height: 50,
                                child:
                                ButtonTheme(
                                    minWidth: 300,
                                    child:
                                    RaisedButton(onPressed: (){
                                      createRecord(categoria.text, descripcion.text, usuario.text);
                                      Navigator.pushNamed(context, '/feed');
                                      }, 
                                        child: 
                                        Text('Compartir',
                                            style: TextStyle(color: Colors.white)),
                                            color: Colors.blue)
                                )
                            ),

                          ],
                        ),
                      ),

                    ]
                )
            )
        )
    );
  }
}

void createRecord(var cat, var des, var user) async
{
  int id;
  databaseReference.collection("publicacion")
      .get()
      .then((res) => databaseReference.collection("publicacion").doc((res.size + 1).toString()).set({
    'categoria': cat,
    'descripcion': des,
    'usuario': user,
    'fecha': DateTime.now(),
  })

 );


}

