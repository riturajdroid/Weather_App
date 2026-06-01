import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


class CurrentWeather{
  final String name;
  final double temperature;
  final String description;
  final int humidity;

  CurrentWeather({
    required this.name,
    required this.temperature,
    required this.description,
    required this.humidity,
  });

  factory CurrentWeather.fromJson(Map<String,dynamic> json){
    return CurrentWeather(
      name: json['name'],
      temperature: json['main']['temp'],
      description: json['weather'][0]['description'],
      humidity: json['main']['humidity']
      );
  }
}

final YOUR_KEY = dotenv.env['WEATHER_API_KEY'] ?? '';
Future<CurrentWeather> fetchWeather (String CITYNAME)async{
  final response= await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$CITYNAME&appid=$YOUR_KEY&units=metric"));

  if(response.statusCode==200){

  final jsonMap = jsonDecode(response.body);
    return CurrentWeather.fromJson(jsonMap);
  } else {
    // If the server did not return a 200 OK response, throw an error.
    throw Exception('Failed to load weather data');
  }
}

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key,required this.city});
  final String city;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<CurrentWeather> weatherFuture;
  @override
  void initState(){
    super.initState();
    weatherFuture=fetchWeather(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.city} Weather')),
      body: Center(
        child: FutureBuilder<CurrentWeather>(
          future: weatherFuture,
          builder: (context, snapshot) {
            // 1. Show a loading spinner while waiting for the API
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } 
            
            // 2. Show an error message if something went wrong
            else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } 
            
            // 3. Show the actual weather data!
            else if (snapshot.hasData) {
              final weather = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${weather.temperature}°C', 
                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    weather.description,
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text('Humidity: ${weather.humidity}%'),
                ],
              );
            }

            return const Text('No data available');
          },
        ),
      ),
    );
  }
}