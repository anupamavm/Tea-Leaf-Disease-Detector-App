import 'package:Drtealeaf/core/theme/app_pallete.dart';
import 'package:Drtealeaf/features/home/presentation/widgets/disease_card.dart';
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
            // Add Scan Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    backgroundColor: AppPallete.mainGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () {
                    context.go('/scan'); // Navigate to the scan page
                  },
                  child: const Text(
                    "Scan Tea Leaves",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppPallete.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    backgroundColor: AppPallete.mainGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () {
                    context.go('/map'); // Navigate to the scan page
                  },
                  child: const Text(
                    "Map",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppPallete.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
