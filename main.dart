import 'package:flutter/material.dart';
import 'package:whatsapp/screens/home_screen/home_screen.dart';
import 'package:whatsapp/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whats app',
      theme: ThemeData.light(),
      routes: {
        "/": (context) => SplashScreen(),
        "home_screen": (context) => HomeScreen()
      },
    );
  }
}
