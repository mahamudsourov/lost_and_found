import 'package:flutter/material.dart';

class FoundItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50], 
      appBar: AppBar(
        title: Center(child: Text('Found Items')),
        backgroundColor: Colors.green, 
      ),
      body: Center(child: Text('Found items list here')),
    );
  }
}