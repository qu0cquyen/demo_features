
import 'package:flutter/material.dart';
import 'package:demo_features/ui/login_page.dart';
import 'package:demo_features/ui/home_page.dart';
import 'package:demo_features/ui/form_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp( 
        debugShowCheckedModeBanner: false,
        home: FormPage(name: "ABC", description: "ASDASD")
    ); 
  }
}
