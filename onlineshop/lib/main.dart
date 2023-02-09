import 'package:flutter/material.dart';
import 'package:onlineshop/screens/profile_screen.dart';
import 'package:onlineshop/screens/userbasket_screen.dart';


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
      
      home: const UserBasketScreen(),
    );
  }
}


