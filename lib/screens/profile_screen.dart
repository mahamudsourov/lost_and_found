import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50], 
      appBar: AppBar(
        title: Center(child: Text('Profile')),
        backgroundColor: Colors.purple,
      ),
      body: Center(child: Text('User Profile')),
    );
  }
}