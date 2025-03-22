import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50], 
      appBar: AppBar(
        title: Center(child: Text('Home')),
        backgroundColor: Colors.blueAccent, 
      ),
      body: Center(
        child: Text(
          'Welcome to Lost & Found!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}