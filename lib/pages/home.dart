import 'package:flutter/material.dart';
import "dart:convert";



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {}; //Map Error
  Object? parameters;
   
  
  

  @override
  Widget build(BuildContext context) {
    //---------------------------------------------------------
    parameters = ModalRoute.of(context)!.settings.arguments;
    Map data = jsonDecode(jsonEncode(parameters));
    //section of code that's giving the Map Error 
    //---------------------------------------------------------



    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, "/location");
            },
            icon: Icon(Icons.edit_location),
            label: Text("Edit Location"),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(data["location"],
                style: TextStyle(
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ))
          
          ]),
          SizedBox (height: 20),
          Text(
            data["time"], //This is where the Error is happening for data map 
            style: TextStyle(
              fontSize: 66,
            ),
          )

        ],
      )
      )
      ),
    );
  }
}
