import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class register extends StatelessWidget{

  final nombre = TextEditingController();
  final Apellido = TextEditingController();
  final Email = TextEditingController();
  final clave = TextEditingController();

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
                      Text('Ingresa tus datos', style: (TextStyle(fontWeight: FontWeight.bold, fontSize: 30)), textAlign: TextAlign.center,),
                      SizedBox(height: 20),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(controller: nombre,decoration: InputDecoration(hintText: 'Nombre')),
                                Container(
                                    child: Text('Ingresa los dos nombres completos si los tienes', style: TextStyle(color: Colors.grey,fontSize: 16),)
                                )
                              ]
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(controller: Apellido,decoration: InputDecoration(hintText: 'Apellido')),
                                Container(
                                    child: Text('Ingresa ambos apellidos', style: TextStyle(color: Colors.grey,fontSize: 16),)
                                )
                              ]
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(controller: Email,decoration: InputDecoration(hintText: 'E-mail')),
                                Container(
                                    child: Text('Asegurate de revisar frecuentemente', style: TextStyle(color: Colors.grey,fontSize: 16),)
                                )
                              ]
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(controller: clave,decoration: InputDecoration(hintText: 'Contraseña')),
                              ]
                          )
                      ),
                      Container(
                          child: Text('Tu clave debe tener entre 6 y 20 caracteres, y al menos uno de ellos debe ser especial (por ejemplo: ?.-!*).', style: TextStyle(color: Colors.grey,fontSize: 16),)
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Container(
                            child: Row(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                  Expanded(
                                      child: Checkbox(value: false,onChanged: null)
                                  ),
                                  Expanded(
                                      flex: 4,
                                      child: Container(
                                          child: Text('Acepto los Términos y condiciones y autorizo el uso de mis datos de acuerdo con la Declaracion de Privacidad', style: TextStyle(color: Colors.black,fontSize: 16),)
                                      )
                                  )
                                ]
                            )
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                          height: 50,
                          child:
                          ButtonTheme(
                              minWidth: 300,
                              child:
                              RaisedButton(onPressed: (){Navigator.pushNamed(context, '/feed');}, child: Text('Continuar',style: TextStyle(color: Colors.white)),color: Colors.blue)
                          )
                      ),
                    ]
                )
            )
        )
    );
  }
}