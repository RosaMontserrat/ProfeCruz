import 'package:flutter/material.dart';
import 'package:flutter_authentication_with_laravel_sanctum1/providers/auth.dart';

import 'package:flutter_authentication_with_laravel_sanctum1/widgets/nav-drawer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Auth(),
      child: MyApp(),
    ), 
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Sanctum authentication'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Primer Practica'),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Consumer<Auth>(
          builder: ( context, auth, child ){
            if(auth.authenticated){
              return Text('Sesion Iniciada');
              }else{
              return Text('¡No has iniciado Sesion!');
            }
          },
        )
      ),
    );
  }
}