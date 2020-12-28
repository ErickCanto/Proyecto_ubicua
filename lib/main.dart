
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        //'/': (context) => Start(),
        '/welcome': (context)=> Welcome(),
        //'/login': (context)=>Login(),
        //'/newacount': (context)=>NewAccount(),
        //'/home': (context)=>Home();
      },
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/welcome',
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Welcome extends StatelessWidget{

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body:(
        Center(
            child: Container(
                child:(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Container(
                            child: Text('Apolo',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent,fontSize: 40),),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Container(
                            child: Text('El lugar donde tus ideas pueden volar y llegar hasta el olimpo',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black38),)
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                                height: 60,
                                child:  ButtonTheme(
                                  minWidth: 300,
                                  child:  RaisedButton(onPressed: (){Navigator.pushNamed(context,'/');}, child: Text('Inicia Sesión', style: TextStyle(color: Colors.white),)),
                                )
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                                height: 60,
                                child:  ButtonTheme(
                                  minWidth: 300,
                                  child:  RaisedButton(onPressed: (){Navigator.pushNamed(context,'/');}, child: Text('Regístrate', style: TextStyle(color: Colors.white),)),
                                )
                            )
                        ),
                      ],
                    )
                )
            )
        )
      )
    );
  }

}
