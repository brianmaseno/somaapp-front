import 'package:flutter/material.dart';
import 'package:somaapp/screens/dashboard.dart';
import 'package:somaapp/screens/dashboard2.dart';
import 'package:somaapp/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soma App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MainPage(),
    );
  }
}

