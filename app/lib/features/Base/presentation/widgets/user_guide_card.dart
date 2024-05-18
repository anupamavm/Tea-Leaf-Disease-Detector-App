import 'package:flutter/material.dart';

class UserGuideCard extends StatelessWidget {
  const UserGuideCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          'Third Row Component',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
