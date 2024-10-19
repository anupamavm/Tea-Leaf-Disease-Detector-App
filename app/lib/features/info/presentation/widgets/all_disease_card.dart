import 'package:flutter/material.dart';

class AllDiseaseCard extends StatelessWidget {
  final String title;
  // final String tagline;
  final String description;
  final String subdesc;
  final String imageUrl;

  const AllDiseaseCard({
    super.key,
    required this.title,
    // required this.tagline,
    required this.description,
    required this.subdesc,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left column containing the image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8), // Add spacing between the columns
          // Right container containing title, tagline, and description
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Text(
                  //   tagline,
                  //   style: const TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  const SizedBox(height: 8),
                  Text(
                    subdesc,
                    maxLines: 3, // Limit to three lines of description
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
