import 'package:covid19api/datasource.dart';
import 'package:covid19api/homepage.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp
  (
    debugShowCheckedModeBanner: false,
    theme:ThemeData(primaryColor:primaryBlack),
    home:HomePage(),
  ));
}
