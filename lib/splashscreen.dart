import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_shared_prefrences/main.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
     checkUserLoggedIn();
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: const Center(
        child: FlutterLogo(
          size: 200,
          style: FlutterLogoStyle.stacked,
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, 'loginScreen');
  }

  Future<void>checkUserLoggedIn()async{
    
    final sharedPrefs = await SharedPreferences.getInstance();
    final userLoggedIn=sharedPrefs.getBool(saveKey);
    if (userLoggedIn==null||userLoggedIn==false) {
      gotoLogin();
      
    }else{
      Navigator.pushReplacementNamed(context, 'homeScreen');
    }
    

  }
}
