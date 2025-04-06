import 'package:flutter/material.dart';

class PostItemScreen extends StatefulWidget {
  final String category;
  final Function(Map<String, String>) onNewItemPosted;

  PostItemScreen({required this.category, required this.onNewItemPosted});

  @override
  _PostItemScreenState createState() => _PostItemScreenState();
}

class _PostItemScreenState extends State<PostItemScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // Submit the item to be posted
  void _submitItem() {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      // Ensure title and description are not null
      widget.onNewItemPosted({
        'title': titleController.text,
        'description': descriptionController.text,
        'category': widget.category,
      });
      Navigator.pop(context); // Go back to the previous screen
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill all fields.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category == "lost" ? 'Post Lost Item' : 'Post Found Item',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Title Field
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Item Title'),
            ),
            // Description Field
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitItem, // Submit function
              child: Text(
                widget.category == "lost"
                    ? 'Post Lost Item'
                    : 'Post Found Item',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
