import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/pages/weatherpage.dart';

class Searchpage extends StatelessWidget {
  Searchpage({super.key});
  
  final myController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
                appBar: AppBar(
                  title: Text("Weather App"),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter name of your city"),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller:myController,
                          selectionWidthStyle: BoxWidthStyle.max,
                          style: TextStyle(fontSize: 20,color: const Color.fromARGB(255, 63, 0, 0)),
                        ),
                      ),
                      ElevatedButton(onPressed: (){
                          Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => WeatherPage(city:myController.text),
                        ),
                      );
                      },
                      child:Text("Get Weather")
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}