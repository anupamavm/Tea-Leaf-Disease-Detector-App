import 'package:app/core/theme/app_pallete.dart';
import 'package:app/features/home/presentation/widgets/disease_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../info/data/disease_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppPallete.mainGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hello, User!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "About Diseases",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/all_diseases');
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppPallete.mainGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: diseases.length > 5 ? 5 : diseases.length,
                itemBuilder: (context, index) {
                  final disease = diseases[index];
                  return GestureDetector(
                    onTap: () {
                      context.go('/disease_detail', extra: disease);
                    },
                    child: DiseaseCard(
                      title: disease.title,
                      tagline: disease.tagline,
                      imageUrl: disease.imageUrl,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
