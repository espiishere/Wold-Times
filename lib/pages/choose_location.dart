import 'package:flutter/material.dart';
import "package:world_time/services/world_time.dart";


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
 List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png', isDaytime: false),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png', isDaytime: false),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png', isDaytime: false),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png', isDaytime: false),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png', isDaytime: false), //Gives wrong time
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png', isDaytime: false), //Gives wrong time 
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png', isDaytime: false),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png', isDaytime: false),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navi to home
    Navigator.pop(context, {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time, //Wrong time for NYC and Chicago
      "isDaytime": instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose your Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {updateTime(index);},
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("${locations[index].flag}"),
                ), 
              ),
              ), 
            );
          }
         
        )
        );
  }
}
