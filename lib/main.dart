import 'package:flutter/material.dart';
import 'package:weather_app/pages/searchpage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


void main() async{
  await dotenv.load(fileName: ".env");
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Searchpage(),
    );
  }
}
