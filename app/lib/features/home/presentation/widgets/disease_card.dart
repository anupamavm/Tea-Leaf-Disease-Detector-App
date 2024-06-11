import 'package:flutter/material.dart';

class DiseaseCard extends StatelessWidget {
  final String title;
  final String tagline;
  final String imageUrl;
  final double height;
  final double width;

  const DiseaseCard({
    Key? key,
    required this.title,
    required this.tagline,
    required this.imageUrl,
    this.height = 200, // Default height if not specified
    this.width = 150, // Default width if not specified
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Container(
        height: height, // Set the height here
        width: width, // Set the width here
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl,
                height: 150, // Adjust height based on card height
                width: 150, // Adjust width based on card width and padding
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Flexible(
              child: Text(
                tagline,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
