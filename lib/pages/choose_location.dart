import 'package:flutter/material.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


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
        // body: ElevatedButton(
        //   onPressed: () {
        //     setState(() {
        //       counter += 1;
        //     });
        //   },
        //   child: Text("counter is: $counter"),
        // )
        );
  }
}