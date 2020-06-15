import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView.builder(shrinkWrap:true,
        physics:ScrollPhysics(),
        itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal:18,vertical:8),
          child :Row(
              children:<Widget>[
                Image.network(countryData[index]['countryInfo']['flag'],height: 80,width:100),
                SizedBox(width:40),
                Column(
                  children: <Widget>[
                    Text(countryData[index]['country'].toString(),style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 12,),textAlign: TextAlign.right,),
                    SizedBox(width:40),
                    Text('Deaths: '+countryData[index]['deaths'].toString(),style:TextStyle(color:Colors.redAccent,fontWeight: FontWeight.bold,fontSize:12),textAlign: TextAlign.right),
                    Text('Active: '+countryData[index]['active'].toString(),style:TextStyle(color:Colors.yellow,fontWeight: FontWeight.bold,fontSize: 12),textAlign: TextAlign.right),
                Text('Cases: '+countryData[index]['cases'].toString(),style:TextStyle(color:Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 12),textAlign: TextAlign.right)
                  ],
                )
              ],
         ),
        );
      },
      itemCount: 215,)
    );
  }
}
