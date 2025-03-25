import 'package:flutter/material.dart';

class LostItemsScreen extends StatelessWidget {
  const LostItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50], 
      appBar: AppBar(
        title: Center(child: Text('Lost Items')),
        backgroundColor: Colors.redAccent, 
      ),
      body: Center(child: Text('Lost items list here')),
    );
  }
}