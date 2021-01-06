import 'package:flutter/material.dart';

class ObjetoTexto extends StatefulWidget {

  final String text;
  final String publicador;
  final String imagenpublicador;
  final String date;
  int likes;

   ObjetoTexto(
      {
        Key key,
        this.text,
        this.likes,
        this.publicador,
        this.imagenpublicador,
        this.date,
      }):super(key:key);

  @override
  _ObjetoTextoState createState() => _ObjetoTextoState();
}

class _ObjetoTextoState extends State<ObjetoTexto>
{
  @override
  Widget build(BuildContext context) {
    //


    if(widget.date == null )
      return Container(
        child: Text("Date null"),
      );

    if(widget.text == null )
      return Container(
        child: Text("Descripcion null"),
      );

    if(widget.publicador == null )
      return Container(
        child: Text("Publicador null"),
      );

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 0),
      width: MediaQuery.of(context).size.width*0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Image.asset(widget.imagenpublicador,width: 80,height: 80,),flex: 1,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.publicador,style: TextStyle(fontSize: 18,color: Colors.black),),
                    Text(widget.date,style: TextStyle(fontSize: 15,color: Colors.black26),),
                  ],
                ),
                flex: 3,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: Text(widget.text,style: TextStyle(fontSize: 18,color: Colors.black),),
          )
        ],
      )
    );
  }
}

class ObjetoFoto extends StatefulWidget{
  final String photo;
  final String publicador;
  final String imagenpublicador;
  final String date;
  int likes;

  ObjetoFoto(
      {
        Key key,
        this.photo,
        this.likes,
        this.publicador,
        this.imagenpublicador,
        this.date,
      }):super(key:key);

  @override
  _StateObjetoFoto createState() => _StateObjetoFoto();
}

class _StateObjetoFoto extends State<ObjetoFoto>{
  @override
  Widget build(BuildContext context) {

  }
}