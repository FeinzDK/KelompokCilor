import 'package:cilore/screens/detaildestinasi.dart';
import 'package:cilore/screens/homescreen.dart';
import 'package:cilore/screens/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "NunitoSans",
      ),
      home: HomeScreen(),
    );
  }
}
