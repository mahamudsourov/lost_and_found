import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostFoundItemScreen extends StatefulWidget {
  final Function(Map<String, String>) onNewItemPosted;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  PostFoundItemScreen({required this.onNewItemPosted});

  @override
  // ignore: library_private_types_in_public_api
  _PostFoundItemScreenState createState() => _PostFoundItemScreenState();
}

class _PostFoundItemScreenState extends State<PostFoundItemScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  File? _image;
  String? _imageUrl;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _imageUrl = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Found Item')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Item Title')),
            TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description')),
            SizedBox(height: 10),
            _image != null
                ? Image.file(_image!, height: 200, fit: BoxFit.cover)
                : Text("No Image Selected"),
            ElevatedButton(onPressed: _pickImage, child: Text('Pick Image')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty &&
                    _imageUrl != null) {
                  widget.onNewItemPosted({
                    'title': titleController.text,
                    'description': descriptionController.text,
                    'imageUrl': _imageUrl!,
                  });
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text("Please fill all fields and select an image.")));
                }
              },
              child: Text('Post Found Item'),
            ),
          ],
        ),
      ),
    );
  }
}
