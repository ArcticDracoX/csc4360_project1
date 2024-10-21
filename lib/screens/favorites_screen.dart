import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text('Your favorite recipes will be shown here.'),
      ),
    );
  }
}
