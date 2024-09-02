import 'package:flutter/material.dart';

class UserGuideCard extends StatelessWidget {
  const UserGuideCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Center(
        child: Text(
          'Third Row Component',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
