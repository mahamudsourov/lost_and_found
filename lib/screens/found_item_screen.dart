import 'package:flutter/material.dart';

class FoundItemsScreen extends StatelessWidget {
  final List<Map<String, String>> items;
  final Function(Map<String, String>) onClaim;

  FoundItemsScreen({Key? key, required this.items, required this.onClaim})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Found Items')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.network(
                    items[index]['imageUrl']!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index]['title']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(items[index]['description']!),
                      SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            onClaim(items[index]);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Claim request sent!')),
                            );
                          },
                          child: Text("Claim"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
