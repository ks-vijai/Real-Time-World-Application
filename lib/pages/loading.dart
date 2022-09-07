import 'package:flutter/material.dart';
import 'package:real_time_world_application/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTimeDate() async{
    WorldTime instance = WorldTime(location: 'Berlin',flag: 'germany.png',url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay' : instance.isDay
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTimeDate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.blueAccent,
          size: 90.0,
        ),
      ),
      );
  }
}
