import 'package:flutter/material.dart';
import 'package:onlineshop/screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        fontFamily: 'SB'
      ),
      
      home: const HomeScreenn(),
    );
  }
}


