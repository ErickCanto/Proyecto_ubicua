import 'package:flutter/material.dart';

class PopupWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PopupWidgetState();
  }

}

class PopupWidgetState extends State<PopupWidget>
{
  int _value=1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Popup Window"),backgroundColor: Colors.pink,

        actions: <Widget>[
          _NomalPopMenu()
        ],),
      body: Container(
        child: Center(
          child: Container(
            decoration:ShapeDecoration(shape: OutlineInputBorder(

            )),
            width: 200,
            height: 40,
            child: Center(child: Text("Value selected $_value",style: TextStyle(color: Colors.pink,fontSize: 20),)),
          ),
        ),
      ),
    );
  }
  Widget _NomalPopMenu() {
    return new PopupMenuButton<int>(
        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
          new PopupMenuItem<int>(
              value: 1, child: new Text('Item One')),
          new PopupMenuItem<int>(
              value: 2, child: new Text('Item Two')),
          new PopupMenuItem<int>(
              value: 3, child: new Text('Item Three')),
          new PopupMenuItem<int>(
              value: 4, child: new Text('I am Item Four'))
        ],
        onSelected: (int value) {
          setState(() { _value = value; });
        });
  }
}