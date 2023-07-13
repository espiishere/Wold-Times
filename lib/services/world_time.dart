import 'package:http/http.dart';
import "dart:convert";
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;
  bool isDaytime; 

  WorldTime({required this.location, required this.flag, required this.url, required this.isDaytime});

  Future<void> getTime() async {
    try {
      // //simulate network request


      //---------------------------------------------------------
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));

      Map data = jsonDecode(response.body) as Map <String, dynamic>; // "Expected a value of type 'Map<dynamic, dynamic>', but got one of type 'Null'" Error  location

      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);  
      //---------------------------------------------------------

      //  print(datetime);
      //  print(offset);


      //---------------------------------------------------------
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 4 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
      //--------------------------------------------------------- 
      //Error with the time for USA States? 
      
    } catch (e) {
      print("caught error: $e");
      time = "could not get time data";
    }
  }
}
