import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart';

class WorldTime {
  String location;
  String time;
  String url;
  String flag;
  bool isDay;
  WorldTime({ this.location, this.flag, this.url});

  Future<void> getTime() async {
    Response res = await get('https://worldtimeapi.org/api/timezone/$url');
    try{
      Map data = jsonDecode(res.body);

      String datetime = data['datetime'];
      String timeZone = data['utc_offset'].substring(1,3);
      //print(timeZone);
      //print(datetime);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(timeZone)));
      isDay = now.hour >6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e)
    {
      print('Error in the data');
      time = 'could not get time';
    }
}
}