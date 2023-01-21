import 'package:flutter/material.dart';
import 'package:flutter_shared_prefrences/firstscreen.dart';
import 'package:flutter_shared_prefrences/homescreen.dart';
import 'package:flutter_shared_prefrences/loginscreen.dart';
import 'package:flutter_shared_prefrences/splashscreen.dart';

const saveKey='userLoggedIn';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        'splashScreen':(context) => const SplashScreen(),
        'loginScreen':(context) => LoginScreen(),
        'homeScreen':(context) => const HomeScreen(),
        'firstScreen':(context) => const FirstScreen(),
      },
    );
  }
}
