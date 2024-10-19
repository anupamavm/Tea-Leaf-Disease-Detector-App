import 'package:flutter/material.dart';
import '../data/disease_data.dart';
import 'widgets/all_disease_card.dart';
import 'package:go_router/go_router.dart';

class AllDiseasesScreen extends StatelessWidget {
  const AllDiseasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Diseases'),
      ),
      body: ListView.builder(
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          final disease = diseases[index];
          return GestureDetector(
            onTap: () {
              context.go('/disease_detail', extra: disease);
            },
            child: AllDiseaseCard(
              title: disease.title,
              // tagline: disease.tagline,
              description: disease.description,
              imageUrl: disease.imageUrl,
              subdesc: disease.subdesc,
            ),
          );
        },
      ),
    );
  }
}
