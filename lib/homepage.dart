import 'dart:convert';
import 'package:covid19api/datasource.dart';
import 'package:covid19api/panels/infopanel.dart';
import 'package:covid19api/panels/mostaffectedcountries.dart';
import 'package:covid19api/panels/worldwidepanel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget
{
  @override
  _HomePageState createState()=>_HomePageState();
}
class _HomePageState extends State<HomePage>
{
  Map indData;
  fetchIndiaData()async
  {
    http.Response response=await http.get('https://disease.sh/v2/countries/india');
    setState(() {
      indData=json.decode(response.body);
    });
  }
  List countryData;
  fetchCountryData()async
  {
    http.Response response=await http.get('https://disease.sh/v2/countries');
    setState(() {
      countryData=json.decode(response.body);
    });
  }
  void initState()
  {
   fetchIndiaData();
   fetchCountryData();
   super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar:AppBar(
        title:Text("COINDID-Covid Tracker"),
      ),
      body:SingleChildScrollView(child:Column(
        children: <Widget>[
          Container(
            height: 100,
            alignment: Alignment.center,
            color:Colors.black54,
            padding:EdgeInsets.all(10),
            child:Text(DataSource.quote,style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 18))
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 9,horizontal: 20),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Indian Cases',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),),
              ],
            ),
          ),
          indData==null?CircularProgressIndicator():IndiaPanel(indData:indData,)
          ,Padding(
            padding: const EdgeInsets.only(top:30),
            child: Text('All Countries',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),textAlign:TextAlign.left,),
          ),
          SizedBox (height:8),
          countryData==null?Container():MostAffectedPanel(countryData:countryData,)
          ,InfoPanel(),
          SizedBox(height:20),
          Padding(
            padding: const EdgeInsets.only(bottom:20),
            child: Padding(
              padding: const EdgeInsets.only(left:20),
              child: Text('Lets Fight against this virus #INDIA LADEGA',textAlign:TextAlign.center,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 24,color: Colors.green),)),
            ),
          Padding(
            padding: const EdgeInsets.only(bottom:20),
            child: Padding(
                padding: const EdgeInsets.only(left:20),
                child: Text('UI design by Akash',textAlign:TextAlign.center,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16,color: Colors.blueGrey),)),
          ),
        ],
      ))
    );
  }
}