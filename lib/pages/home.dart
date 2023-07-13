
import 'package:flutter/material.dart';
import "dart:convert";



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {}; //Map Error
  

  @override
  Widget build(BuildContext context) {
    //---------------------------------------------------------
     bool isMapEmpty = data.isEmpty;
    if (isMapEmpty) {
      data = ModalRoute.of(context)?.settings.arguments as Map;
    }
    //section of code that's giving the Map Error 
    //---------------------------------------------------------
    print(data);

    //set background

    String bgImage = data["isDaytime"] ? "day.png" : "night.png";
    Color bgColor = data["isDaytime"] ? Colors.blue : Colors.indigo[700]!;



    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("$bgImage"),
              fit: BoxFit.cover, 
              )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
          children: [
            TextButton.icon(
              onPressed: () async {
               dynamic result = await Navigator.pushNamed(context, "/location");
               setState(() {
                 data = {
                  "time": result["time"],
                  "location": result["location"],
                  "isDaytime": result["isDaytime"],
                  'flag': result["flag"]


                  

                 };
               });
              },
              icon: Icon(
                    Icons.edit_location,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
            SizedBox(height: 20.0),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(data["location"],
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                    color: Colors.white
                  ))
            
            ]),
            SizedBox (height: 20),
            Text(
              data["time"], 
              style: TextStyle(
                fontSize: 66,
                color: Colors.white
              ),
            )
        
          ],
              )
              ),
        )
      ),
    );
  }
}
