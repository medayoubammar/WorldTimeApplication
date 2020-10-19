import 'package:http/http.dart'; // to use the get() function
import 'dart:convert'; // to use the jsonDecode function
import 'package:intl/intl.dart';

class WorldTime {
  String location ; // location name for UI
  String time ; // the time in that location
  String flag; //url of flag icon
  String url;
  String isDayTime;


  WorldTime({ this.location , this.flag , this.url , this.isDayTime});


 Future<void> getTime() async {

   try{
     //make the request
     Response response  =  await get('http://worldtimeapi.org/api/timezone/$url');
     print(response);
     //decoding the data
     Map data = await jsonDecode(response.body);
     print(data);
     //get informations
     String dateTime = await data['datetime'];
     print(dateTime);
     String utc = await data['utc_offset'].substring(1,3); // to cut the important part
     print(utc);
     // print(dateTime+" "+utc);
     // print(data);

     //Create DateTime object
     DateTime now =   DateTime.parse(dateTime);
     int utcNow =  int.parse(utc);
     now =  now.add(Duration( hours: utcNow ));

     //print("Hours : ${now.hour} and Minutes ${now.minute}");

    // time = now.toString();  //set the time property

      time = DateFormat.jm().format(now);

        //  isDayTime = (now.hour > 3) && (now.hour < 20 ) ? true : false ;
int hours = now.hour ;
if( (hours > 3 ) && (hours < 20)) {
  isDayTime = 'true' ;
}
else
  {
    isDayTime = 'false' ;
  }

print(isDayTime);


   } catch(e) {
       print(e);
       time = "wifi problem , try again..";
   }



  }


}

