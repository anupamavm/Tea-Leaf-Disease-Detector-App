import 'package:flutter/material.dart';
import '../data/disease_data.dart'; // Import your disease data file
import 'package:app/features/info/presentation/disease_detail_screen.dart'; // Import DiseaseDetailScreen
import 'widgets/all_disease_card.dart'; // Import NewDiseaseCard

class AllDiseasesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Diseases'),
      ),
      body: ListView.builder(
        itemCount: diseases.length, // Accessing directly from disease_data.dart
        itemBuilder: (context, index) {
          final disease = diseases[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiseaseDetailScreen(disease: disease),
                ),
              );
            },
            child: AllDiseaseCard(
              title: disease.title,
              tagline: disease.tagline,
              description: disease.description,
              imageUrl: disease.imageUrl,
            ),
          );
        },
      ),
    );
  }
}
