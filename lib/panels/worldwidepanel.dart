import 'package:flutter/material.dart';
class IndiaPanel extends StatelessWidget {
  final Map indData;
  const IndiaPanel({Key key, this.indData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:Colors.grey[800],
      ),
      child:GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , childAspectRatio: 2),
            children: <Widget>[
              StatusPanel(
                title: 'CONFIRMED',
                panelColor: Colors.red[200],
                textColor: Colors.black54,
                count: indData['cases'].toString(),
              ),
              StatusPanel(
                title: 'ACTIVE',
                panelColor: Colors.yellow[300],
                textColor: Colors.black54,
                count: indData['active'].toString(),
              ),
              StatusPanel(
                title: 'RECOVERED',
                panelColor: Colors.lightBlueAccent[200],
                textColor: Colors.black54,
                count: indData['recovered'].toString(),
              ),
              StatusPanel(
                title: 'DEATHS',
                panelColor: Colors.red[300],
                textColor: Colors.black54,
                count: indData['deaths'].toString(),
              ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget
{
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    double width=MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.all(6),
        height:80,width:width/2,
        color:panelColor,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(title,style:TextStyle(fontWeight:FontWeight.bold,fontSize:15,color: textColor),),Text(count,style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: textColor ) ,)],
      )
    );
  }
}