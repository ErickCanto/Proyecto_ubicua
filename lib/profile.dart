import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class profile extends StatefulWidget{
  @override
  stateprofile createState()=> stateprofile();
}

//Lo dificil va a ser hacer esto dinámico, en teoría
//deberíamos hacer que a este metodo reciba algun parametro para identificar el
//perfil y con ese ID hacer la petición de flutter
//Espero que sepas como adaptar el código para que se pueda mostrar la información
//correspondiente al perfil dependiendo de lo obtenido por firebase
//Todo esto creo que se puede hacer con stateless widgets pero no estoy seguro

class stateprofile extends State<profile>
{
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
                        child: Image.asset("lib/assets/images/Toth.png",width: 200, height: 200),
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
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2,color: Colors.blue,)
                        ),
                        child: Text("Aqui se vería la biografia del sujeto que e"
                            "sté usando la aplicacion, solo espero que no se des"
                            "borde el texto porque me mato",textAlign: TextAlign.center, style: TextStyle(color: Colors.black87,fontSize: 15),),
                      ),
                  )
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
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Categorias'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Perfil'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Ayuda'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}