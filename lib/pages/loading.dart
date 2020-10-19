import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

 // String timeScreen ="Loading";

 void setUpWorldTime(BuildContext context) async {
    WorldTime instance = WorldTime(location: "Tunisia", flag: "Tunisia.png", url: "Africa/Tunis");
    await instance.getTime();
 /* print(instance.time);
    timeScreen = instance.time;
  }); */
 Navigator.pushReplacementNamed(context, '/home', arguments: {'location' : instance.location , 'flag' : instance.flag ,
   'time' : instance.time ,'isDayTime' : instance.isDayTime,
 });
}


  @override
  void initState() {

    super.initState();

  }




  @override
  Widget build(BuildContext context) {

    setUpWorldTime(context);
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child:
        SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        )
        ,
      )
    );
  }
}
