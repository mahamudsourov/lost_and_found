import 'package:flutter/material.dart';

class LostItemsScreen extends StatelessWidget {
  final List<Map<String, String>> items;

  // ignore: use_super_parameters
  const LostItemsScreen({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lost Items')),
      body: items.isEmpty
          ? Center(child: Text("No lost items available"))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.network(items[index]['imageUrl']!,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(items[index]['title']!,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text(items[index]['description']!),
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
