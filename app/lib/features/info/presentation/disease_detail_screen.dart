import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart'; // Import flutter_markdown package
import '../data/disease_data.dart'; // Adjust import based on your file structure

class DiseaseDetailScreen extends StatelessWidget {
  final Disease disease;

  const DiseaseDetailScreen({Key? key, required this.disease})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(disease.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                disease.imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              disease.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),

            // Render Markdown content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: MarkdownBody(data: disease.description),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
