import 'package:flutter/material.dart';

class ClaimedItemsScreen extends StatelessWidget {
  const ClaimedItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50], 
      appBar: AppBar(
        title: Center(child: Text('Claimed Items')),
        backgroundColor: Colors.orangeAccent, 
      ),
      body: Center(child: Text('Claimed items list here')),
    );
  }
}