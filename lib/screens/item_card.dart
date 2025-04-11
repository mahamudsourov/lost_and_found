import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final bool showClaimButton;

  // ignore: use_key_in_widget_constructors
  const ItemCard({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.showClaimButton,
  });

  void claimItem(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Claim request sent for $title!')));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 3,
      child: ListTile(
        leading:
            Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: showClaimButton
            ? ElevatedButton(
                onPressed: () => claimItem(context),
                child: Text('Claim'),
              )
            : null,
      ),
    );
  }
}
