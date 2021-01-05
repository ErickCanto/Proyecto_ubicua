import 'package:flutter/material.dart';
import 'popup.dart';
import 'package:firebase_core/firebase_core.dart';

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
                      padding: EdgeInsets.all(16),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2,color: Colors.blue,)
                        ),
                        child: Text("Aqui se vería la biografia del sujeto que e"
                            "sté usando la aplicacion, solo espero que no se des"
                            "borde el texto porque me mato",textAlign: TextAlign.center, style: TextStyle(color: Colors.black87,fontSize: 15),),
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
                  )
                  //TODO: A partir de aqui se comenzaría a llenar con cosas de la persona
                  //TODO: Voy a investigar la forma de hacerlo fácil
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