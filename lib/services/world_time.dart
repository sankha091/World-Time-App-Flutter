import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;  //location to be displayed on ui.
  String time = "";  //time in the selected location.
  String flag;  //url to an asset flag icon.
  String urll;  //url of the location endpoints.
  bool daytime= true; //true if its daytime else flase.

  WorldTime({required this.location, required this.flag, required this.urll});

  Future<void> getTime() async {

    try{
      //run some code in here.
      var url = Uri.parse('http://worldtimeapi.org/api/timezone/$urll');
      var response = await http.get(url);
      Map data = jsonDecode(response.body);

      //get datetime and utcoffset properties from json file
      String datetime = data['datetime'];
      String utcoffset = data['utc_offset'].substring(0,3);
      String offset = data['utc_offset'].substring(4,6);

      //create a datetime object using the DateTime class in dart
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(utcoffset)));
      now = now.add(Duration(minutes: int.parse(offset)));
      print(now);

      //Setting the time property
      daytime = now.hour>5 && now.hour<19 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      //in case try block fails run the codes in here.
      time = "OOPS!!";
    }
  }
}

