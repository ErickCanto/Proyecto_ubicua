import 'package:flutter/material.dart';

class FAQ extends StatelessWidget
{
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
                    child: ListView(
                        //: MainAxisAlignment.start,
                        children: [
                          Text('FAQ', style: (TextStyle(fontWeight: FontWeight.bold, fontSize: 30)), textAlign: TextAlign.center,),
                          SizedBox(height: 100),
                          Container(
                            child: Text('¿Que hacen con mis datos?', style: (TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), textAlign: TextAlign.center,),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Text('Los datos recopilados son mandados a la'
                                'fabulosa tierra de nunca jamás, donde son secuestrados'
                                'por el temible capitán garfio.', style: (TextStyle(fontWeight: FontWeight.normal, fontSize: 17)), textAlign: TextAlign.justify,),
                          ),
                          Container(
                            child: Text('¿Por que no puedo ver contenido que me gusta?', style: (TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), textAlign: TextAlign.center,),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Text('Eso se debe posiblemente a que los artistas'
                                'de hoy en día como badbunny no tiene nada de talento'
                                'y sin embargo inexplicablemente es extremadamente popular. Le '
                                'recomendamos ponerse a escuchar a Silvio Rodriguez o'
                                'Chick Corea en youtube. No se arrepentirá ', style: (TextStyle(fontWeight: FontWeight.normal, fontSize: 17)), textAlign: TextAlign.justify,),
                          ),
                          Container(
                            child: Text('¿Como puedo eliminar un elemento de mi perfil?', style: (TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), textAlign: TextAlign.center,),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Text('El proyecto, aunque terminado, no contiene la funcionalidad'
                                'de una aplicación desarrollada en más de un mes debido a la falta de tiempo'
                                'en el proceso de desarrollo de este proyecto, por lo cual cosas como el login y el delete'
                                'no funcionan correctamente', style: (TextStyle(fontWeight: FontWeight.normal, fontSize: 17)), textAlign: TextAlign.justify,),
                          ),
                          SizedBox(height: 50),
                          SizedBox(
                              height: 50,
                              child:
                              ButtonTheme(
                                  minWidth: 300,
                                  child:
                                  RaisedButton(onPressed: (){Navigator.pushNamed(context, '/feed');}, child: Text('Reportar un problema',style: TextStyle(color: Colors.white)),color: Colors.red)
                              )
                          ),
                          SizedBox(height: 50),
                          SizedBox(
                              height: 50,
                              child:
                              ButtonTheme(
                                  minWidth: 300,
                                  child:
                                  RaisedButton(onPressed: (){Navigator.pushNamed(context, '/Inicio');}, child: Text('Hacer una queja',style: TextStyle(color: Colors.white)),color: Colors.redAccent)
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