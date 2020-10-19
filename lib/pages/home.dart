//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Map data = {};


  @override
  Widget build(BuildContext context) {
    setState(() => context = context);
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data ;



    //set background
    String bgImage = data['isDayTime'] == 'true' ? 'day.png' : 'night.png';
    Color appCl = data['isDayTime'] == 'true' ? Colors.lightBlue[900] : Colors.blue[900];
    Color infoColor = data['isDayTime'] == 'true' ? Colors.black87 : Colors.white70;

    return
    Scaffold(
      appBar: AppBar(
        backgroundColor: appCl,
        title: Text("Home"),
        centerTitle: true,
      ),
      body:

      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit:BoxFit.cover
          )
        ),
        child: Padding(

          padding: const EdgeInsets.fromLTRB(0,120,0,0),
          child: Column(

            children : <Widget> [
            FlatButton.icon(onPressed: () async {

                   dynamic result =  await Navigator.pushNamed( context, '/location');
                   setState(() {
                     data = {
                       'time' : result['time'],
                       'location' : result['location'],
                       'isDayTime' : result['isDayTime'],
                       'flag' : result['flag'],
                     };
                 });
              }, icon: Icon(Icons.edit_location ,color: infoColor,), label: Text("Choose Location" ,style: TextStyle(color: infoColor),)),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(data['location']
                ,style: TextStyle(fontSize: 25 , letterSpacing: 2 ,color: infoColor),
                ),

              ],
            )
              ,SizedBox(height: 20,),
              Text(data['time']
                ,style: TextStyle(fontSize: 60 , letterSpacing: 2 , color: infoColor),
              ),
            ]),
        ),
      )


    );
  }
}
