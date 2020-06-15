import 'package:covid19api/datasource.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap:()
      {
        launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding:EdgeInsets.symmetric(vertical: 12,horizontal: 20) ,
              margin:EdgeInsets.symmetric(vertical: 4,horizontal: 10),
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:Colors.grey
              ),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Some Myths',style:TextStyle(color: primaryBlack,fontWeight: FontWeight.bold,fontSize: 22),),
                  Icon(Icons.arrow_forward_ios,color: Colors.white,)
                ],
              ),
            ),

               GestureDetector(
                 onTap:(){
                   launch('https://www.mygov.in/covid-19');
                 },
               child: Container(
                padding:EdgeInsets.symmetric(vertical: 12,horizontal: 20) ,
                margin:EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:Colors.grey
                ),

                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('COVID-INDIA',style:TextStyle(color: primaryBlack,fontWeight: FontWeight.bold,fontSize: 22),),
                    Icon(Icons.arrow_forward_ios,color: Colors.white,)
                  ],
                ),
            ),
             ),
          ],
        )
      ),
    );
  }
}
