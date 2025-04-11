import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart';

class SettingsScreen extends StatefulWidget {
  final Function(bool)? toggleTheme;

  const SettingsScreen({super.key, this.toggleTheme});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isNotificationEnabled = true;
  bool _isDarkModeEnabled = false;

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkModeEnabled = value;
    });
    if (widget.toggleTheme != null) {
      widget.toggleTheme!(_isDarkModeEnabled);
    }
    if (_isDarkModeEnabled) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.account_circle,
                      size: 60, color: Colors.blueAccent),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Tamim Iqbal',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('tamim@gmail.com',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading:
                        const Icon(Icons.notifications, color: Colors.blueAccent),
                    title: const Text('Notifications'),
                    trailing: Switch(
                      value: _isNotificationEnabled,
                      onChanged: (value) {
                        setState(() {
                          _isNotificationEnabled = value;
                        });
                      },
                    ),
                    tileColor: Colors.blue[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                  ),
                  const SizedBox(height: 15),
                  ListTile(
                    leading:
                        const Icon(Icons.dark_mode, color: Colors.blueAccent),
                    title: const Text('Dark Mode'),
                    trailing: Switch(
                      value: _isDarkModeEnabled,
                      onChanged: _toggleDarkMode,
                    ),
                    tileColor: Colors.blue[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                  ),
                  const SizedBox(height: 15),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.blueAccent),
                    title: const Text('Logout'),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => LoginScreen(
                                  toggleTheme: widget.toggleTheme,
                                )),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Logged out successfully!")),
                      );
                    },
                    tileColor: Colors.blue[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
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
