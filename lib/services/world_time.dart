import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  DateTime time;
  String url;
  String flag;
  bool isDay;

  WorldTime(this.url, this.location, this.flag);

  Future<void> getTime() async {

    try {
      Response res = await get('http://worldtimeapi.org/api/timezone/${url}');
      Map tdata = jsonDecode(res.body);
      DateTime datetime = DateTime.parse(tdata['datetime']);
      String offseth = tdata['utc_offset'].substring(0,3);
      String offsetm = tdata['utc_offset'][1]+tdata['utc_offset'].substring(4,6);

      DateTime now = datetime.add(Duration(hours: int.parse(offseth), minutes: int.parse(offsetm)));
      isDay = ((now.hour>=6)&&(now.hour<19)) ? true : false ;
      //isDay = true;
      time = now;
    } catch(e) {
      print(e);
      isDay = true;
      time = DateTime.now();
    }
  }
}