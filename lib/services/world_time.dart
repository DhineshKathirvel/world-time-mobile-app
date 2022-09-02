import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String flag;
  String path;
  bool isDayTime = false;

  WorldTime({required this.location, required this.flag, required this.path});

  Future<String> getTime() async {
    String time;
    try {
      var uri = Uri.http('worldtimeapi.org', '/api/timezone/$path');
      Response response = await get(uri);
      Map data = jsonDecode(response.body);
      DateTime now = DateTime.parse(data['datetime']);
      now = now.add(Duration(hours: int.parse(data['utc_offset'].substring(1, 3))));
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    }catch(error){
      time = "Could not get time";
    }
    return time;
  }
}