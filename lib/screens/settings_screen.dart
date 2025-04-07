import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lost_and_found/screens/login_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isNotificationEnabled = true;
  bool _isDarkModeEnabled = false; // Track dark mode state

  // Function to toggle dark mode
  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkModeEnabled = value;
    });
    if (_isDarkModeEnabled) {
      // Switch to dark mode
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    } else {
      // Switch to light mode
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 60,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tamim Iqbal',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Tamim@gmail.com',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Settings List
            Expanded(
              child: ListView(
                children: [
                  // Notifications
                  ListTile(
                    leading: Icon(
                      Icons.notifications,
                      color: Colors.blueAccent,
                    ),
                    title: Text('Notifications'),
                    trailing: Switch(
                      value: _isNotificationEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          _isNotificationEnabled = value;
                        });
                      },
                    ),
                    tileColor: Colors.blue[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  SizedBox(height: 15),

                  // Dark Mode
                  ListTile(
                    leading: Icon(Icons.dark_mode, color: Colors.blueAccent),
                    title: Text('Dark Mode'),
                    trailing: Switch(
                      value: _isDarkModeEnabled,
                      onChanged: _toggleDarkMode, // Toggle dark mode
                    ),
                    tileColor: Colors.blue[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  SizedBox(height: 15),

                  // Privacy & Security
                  ListTile(
                    leading: Icon(Icons.lock, color: Colors.blueAccent),
                    title: Text('Privacy & Security'),
                    onTap: () {},
                    tileColor: Colors.blue[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  SizedBox(height: 15),

                  // About Us
                  ListTile(
                    leading: Icon(Icons.info, color: Colors.blueAccent),
                    title: Text('About Us'),
                    onTap: () {
                      // Displaying team members in the About Us dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("About Us"),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Team Members:'),
                                SizedBox(height: 10),
                                Text('Mahamudul Sourov'),
                                Text('Nahid Islam'),
                                Text('Shovan Turzo'),
                                Text('Taifur Rahman'),
                                Text('Mohammad Shuvo'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    tileColor: Colors.blue[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  SizedBox(height: 15),

                  // Logout
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.blueAccent),
                    title: Text('Logout'),
                    onTap: () {
                      // Navigate to the LoginScreen after logout
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Logged out successfully!")),
                      );
                    },
                    tileColor: Colors.blue[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
