import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_ubicua/ObjetosdeFeed.dart';
import 'package:flutter/foundation.dart';

final databaseReference = Firestore.instance;

class profile extends StatefulWidget{
  @override
  stateprofile createState()=> stateprofile();
}

//Lo dificil va a ser hacer esto dinámico, en teoría
//deberíamos hacer que a este metodo reciba algun parametro para identificar el
//perfil y con ese ID hacer la petición de firebase
//Espero que sepas como adaptar el código para que se pueda mostrar la información
//correspondiente al perfil dependiendo de lo obtenido por firebase
//Todo esto creo que se puede hacer con stateless widgets pero no estoy seguro

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }
class stateprofile extends State<profile>
{
  var _selection = WhyFarther.tradingCharter;

  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          titleSpacing: 0,
          automaticallyImplyLeading: true,
      ),
      body:
        Container(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
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
                        child: Text("Bad Bunny", style: TextStyle(fontSize: 20,color: Colors.white)),
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2,color: Colors.blue,)
                        ),
                        child: Text("Yo no hago cancione', hago himnos pa' que no caduquen",textAlign: TextAlign.center, style: TextStyle(color: Colors.black87,fontSize: 15),),
                      ),
                  ),
                  //TODO: Este sería el boton para reportar y cosas así. Aun no se como va a ir
                  //TODO: Yo creo que quizá no es necesario que funcione
                  PopupMenuButton<WhyFarther>(
                    onSelected: (WhyFarther result) { setState(() { _selection = result; }); },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
                      const PopupMenuItem<WhyFarther>(
                        value: WhyFarther.harder,
                        child: Text('Working a lot harder'),
                      ),
                      const PopupMenuItem<WhyFarther>(
                        value: WhyFarther.smarter,
                        child: Text('Being a lot smarter'),
                      ),
                      const PopupMenuItem<WhyFarther>(
                        value: WhyFarther.selfStarter,
                        child: Text('Being a self-starter'),
                      ),
                      const PopupMenuItem<WhyFarther>(
                        value: WhyFarther.tradingCharter,
                        child: Text('Placed in charge of trading charter'),
                      ),
                    ],
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width)*0.8,
                    child: Divider(
                      color: Colors.black12,
                      thickness: 3,
                    ),
                  ),
                  //TODO: A partir de aqui se comenzaría a llenar con cosas de la persona
                  //TODO: Voy a investigar la forma de hacerlo fácil
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
                                      height: 400,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (context, index)
                                          {
                                            int cont = index;
                                            if(snapshot.data[index].data()["usuario"] == 'Bad Bunny')
                                              {
                                                return
                                                  Column(
                                                    children: <Widget>[
                                                      ObjetoTexto(
                                                        publicador: snapshot.data[index].data()["usuario"],
                                                        imagenpublicador: "lib/assets/images/Erick.jpeg",
                                                        text: snapshot.data[index].data()["descripcion"],
                                                        date: formatter.format(snapshot.data[index].data()["fecha"].toDate()),
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Padding(
                                                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                                            child: SizedBox(
                                                                height: 50,
                                                                child:
                                                                ButtonTheme(
                                                                    minWidth: 50,
                                                                    child:
                                                                    RaisedButton(onPressed: (){
                                                                      deleteData(cont);
                                                                    },
                                                                        child:
                                                                        Text('Eliminar',
                                                                            style: TextStyle(color: Colors.white)),
                                                                        color: Colors.red)
                                                                )
                                                            ),

                                                          )

                                                        ],
                                                      ),
                                                    ],
                                                  );

                                              }
                                            else
                                              return Container();

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
                ],
              )
            ],
          ),
        ),
      drawer: Drawer(
        child: ListView(
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
              title: Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Ayuda'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/faq');
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

void deleteData(var id)
{
  debugPrint(id.toString() + "*************************************************************************************************************");
  try{
    //databaseReference.collection('publicacion').doc(id).delete();
  }
  catch(e)
  {
    print(e.toString());
  }
}