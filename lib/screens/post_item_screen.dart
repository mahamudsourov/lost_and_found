import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostItemScreen extends StatefulWidget {
  final String category;
  final Function(Map<String, String>) onNewItemPosted;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  PostItemScreen({required this.category, required this.onNewItemPosted});

  @override
  // ignore: library_private_types_in_public_api
  _PostItemScreenState createState() => _PostItemScreenState();
}

class _PostItemScreenState extends State<PostItemScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  File? _image;
  String? _imageUrl;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _imageUrl = pickedFile.path;
      });
    }
  }

  void _submitItem() {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        _imageUrl != null) {
      widget.onNewItemPosted({
        'title': titleController.text,
        'description': descriptionController.text,
        'imageUrl': _imageUrl!,
        'category': widget.category,
      });
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields and select an image.")),
      );
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
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Item Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 10),
            _image != null
                ? Image.file(_image!, height: 200, fit: BoxFit.cover)
                : Text("No Image Selected"),
            ElevatedButton(onPressed: _pickImage, child: Text('Pick Image')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitItem,
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
