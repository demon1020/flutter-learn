import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String markerId;

  DetailsScreen({super.key, required this.markerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marker Details'),
      ),
      body: Center(
        child: Text('You tapped on marker: $markerId'),
      ),
    );
  }
}
