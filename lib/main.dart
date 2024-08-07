import 'package:flutter/material.dart';
import 'package:world_clock/splashscreen.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'World_Clock',
      theme: ThemeData(
       
      
        useMaterial3: true,
      ),
      home:  SplashScreen(),
    );
  }
}