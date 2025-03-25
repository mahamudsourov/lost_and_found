import 'package:flutter/material.dart';
//import 'package:lost/screens/home_page.dart';
import 'package:lost_and_found/screens/found_item_screen.dart';
import 'package:lost_and_found/screens/home_page.dart';
import 'package:lost_and_found/screens/lost_items_screens.dart';
//import 'lost_items_screen.dart';
//import 'found_items_screen.dart';
import 'claimed_items_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    LostItemsScreen(),
    FoundItemsScreen(),
    ClaimedItemsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue, 
        selectedItemColor: Colors.white, 
        unselectedItemColor: Colors.black54, 
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Lost'),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle), label: 'Found'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_turned_in), label: 'Claimed'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}