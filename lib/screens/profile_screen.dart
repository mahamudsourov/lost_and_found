import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
<<<<<<< HEAD
  final List<Map<String, String>> claimedItems = [];
  final List<Map<String, String>> postedItems = [];
=======
  final List<Map<String, String>> claimedItems =
      []; 
  final List<Map<String, String>> postedItems =
      []; 
>>>>>>> 23f8b34a1a1a40fd9888b0b27f3eacf57e34c506

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Profile')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Icon(Icons.account_circle, size: 80, color: Colors.blue),
                  SizedBox(height: 10),
                  Text(
                    "Tamim Iqbal",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Tamim@gmail.com",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('My Posted Items'),
              onTap: () {
                _showPostedItems(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.assignment_turned_in),
              title: Text('Claimed Items'),
              onTap: () {
                _showClaimedItems(context);
              },
            ),
          ],
        ),
      ),
    );
  }

<<<<<<< HEAD
=======
  
>>>>>>> 23f8b34a1a1a40fd9888b0b27f3eacf57e34c506
  void _showPostedItems(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("My Posted Items"),
            content:
                postedItems.isEmpty
<<<<<<< HEAD
                    ? Text("No items posted yet.")
=======
                    ? Text(
                      "No items posted yet.",
                    ) 
>>>>>>> 23f8b34a1a1a40fd9888b0b27f3eacf57e34c506
                    : Column(
                      mainAxisSize: MainAxisSize.min,
                      children:
                          postedItems.map((item) {
                            return ListTile(
                              title: Text(item['title']!),
                              subtitle: Text(item['description']!),
                            );
                          }).toList(),
                    ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Close"),
              ),
            ],
          ),
    );
  }

<<<<<<< HEAD
=======
  
>>>>>>> 23f8b34a1a1a40fd9888b0b27f3eacf57e34c506
  void _showClaimedItems(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Claimed Items"),
            content:
                claimedItems.isEmpty
<<<<<<< HEAD
                    ? Text("No items claimed yet.")
=======
                    ? Text(
                      "No items claimed yet.",
                    ) 
>>>>>>> 23f8b34a1a1a40fd9888b0b27f3eacf57e34c506
                    : Column(
                      mainAxisSize: MainAxisSize.min,
                      children:
                          claimedItems.map((item) {
                            return ListTile(
                              title: Text(item['title']!),
                              subtitle: Text(item['description']!),
                            );
                          }).toList(),
                    ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Close"),
              ),
            ],
          ),
    );
  }
}
