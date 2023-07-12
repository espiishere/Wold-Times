import 'package:http/http.dart';
import "dart:convert";
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = '';
  String flag;
  String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // //simulate network request

      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));

      Map data = jsonDecode(response.body) as Map <String, dynamic>;

      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);
      //  print(datetime);
      //  print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);

      //print(data);
      // Map data = jsonDecode(response.body);
      // print(data);
      // print(data["title"]);
    } catch (e) {
      print("caught error: $e");
      time = "could not get time data";
    }
  }
}
