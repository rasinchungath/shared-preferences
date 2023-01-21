import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[400],
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, 'firstScreen');
          }, 
          icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Center(
        child: Text('Home Screen', style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
    
  }
}