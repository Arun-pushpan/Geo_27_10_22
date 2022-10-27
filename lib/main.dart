//
// import 'package:flutter/material.dart';
// import 'package:geograf/screens/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geograf/screens/login.dart';
import 'package:geograf/screens/register.dart';
import 'package:geograf/screens/userprofile.dart';

import 'screens/rout_page.dart'as route;
main(){
runApp(Myapp());
}
class Myapp extends StatelessWidget {
  final appTitle="GEOGRAF" ;
  const Myapp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:appTitle,
      onGenerateRoute: route.controller,//initialRoute: route.welcomePage,
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        backgroundColor: Color.fromRGBO(215, 250, 206,1),
        brightness:Brightness.light,
        primarySwatch:Colors.green,

      ),
      home:SplashScreenPage(),
    );

  }
}




