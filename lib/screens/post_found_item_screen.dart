import 'package:flutter/material.dart';

class PostFoundItemScreen extends StatefulWidget {
  const PostFoundItemScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PostFoundItemScreenState createState() => _PostFoundItemScreenState();
}

class _PostFoundItemScreenState extends State<PostFoundItemScreen> {
  final _formKey = GlobalKey<FormState>();
  String? itemName;
  String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Found Item')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Item Name'),
                onSaved: (value) => itemName = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) => description = value,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}