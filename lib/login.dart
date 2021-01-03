import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class login extends StatelessWidget
{

  final user = TextEditingController();
  final pass = TextEditingController();
  final scroller = ScrollController();

  @override dispose()
  {

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        body:
        ListView(
          controller: scroller,
          children: [
            Center(
                child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height*0.9,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Ingresa tu email y contraseña', style: (TextStyle(fontWeight: FontWeight.bold, fontSize: 30)), textAlign: TextAlign.center,),
                          SizedBox(height: 100),
                          TextField(controller: user, decoration: InputDecoration(hintText: "Email"),),
                          SizedBox(height: 50),
                          TextField(controller: pass, decoration: InputDecoration(hintText: "Password"),),
                          SizedBox(height: 50),
                          SizedBox(
                              height: 50,
                              child:
                              ButtonTheme(
                                  minWidth: 300,
                                  child:
                                  RaisedButton(onPressed: (){Navigator.pushNamed(context, '/feed');}, child: Text('Ingresar',style: TextStyle(color: Colors.white)),color: Colors.blue)
                              )
                          ),
                          SizedBox(height: 90),
                          SizedBox(
                              height: 50,
                              child:
                              ButtonTheme(
                                  minWidth: 300,
                                  child:
                                  RaisedButton(onPressed: (){Navigator.pushNamed(context, '/Inicio');}, child: Text('No se mi contraseña',style: TextStyle(color: Colors.blue)),color: Colors.white)
                              )
                          )
                        ]
                    )
                )
            )
          ],
        )
    );
  }
}