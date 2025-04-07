import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final List<Map<String, String>> claimedItems =
      []; 
  final List<Map<String, String>> postedItems =
      []; 

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

  
  void _showPostedItems(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("My Posted Items"),
            content:
                postedItems.isEmpty
                    ? Text(
                      "No items posted yet.",
                    ) 
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

  
  void _showClaimedItems(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Claimed Items"),
            content:
                claimedItems.isEmpty
                    ? Text(
                      "No items claimed yet.",
                    ) 
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
