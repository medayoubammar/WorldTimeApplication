import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

 // List<WorldTime> locations ;
  // ignore: must_call_super
  //void initState() {

 // }

  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Tunis', location: 'Tunisia', flag: 'tunisia.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

void updateTime(BuildContext context,index) async
{
  WorldTime currentLoc = locations[index];
  await currentLoc.getTime();
  Navigator.pop(context,
      {'location' : currentLoc.location , 'flag' : currentLoc.flag ,
    'time' : currentLoc.time ,'isDayTime' : currentLoc.isDayTime
  });
}

  /*
  //async code episode
  void getData() async {

  await  Future.delayed(Duration( seconds : 3), () { print('hi after 3s');} );
    Future.delayed(Duration( seconds : 3), () { print('hi after 3s second');} );
    Future.delayed(Duration( seconds : 3), () { print('hi after 3s third');} );

  }
*/


  @override
  Widget build(BuildContext context) {
    //setState(() => context = context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose Location"),
        centerTitle: true,
        leading: Container(),
      ),
      body:
      Container(
        color: Colors.white70,
        child: ListView.builder(

            itemCount: locations.length,
            itemBuilder: (context, index){

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(color: Colors.white60,child:
                 ListTile(onTap: () {
                   updateTime(context,index);
                   }, title: Text(locations[index].location),
                   leading: CircleAvatar(backgroundImage: AssetImage('assets/${locations[index].flag}'),)

                   ,),


                ),
              );

            }
            ),
      )
      ,
    );
  }
}
