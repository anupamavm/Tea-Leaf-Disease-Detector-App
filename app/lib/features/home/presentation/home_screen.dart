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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dr.TeaLeaf',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppPallete.blackColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "About Diseases",
                    style: TextStyle(
                      fontSize: 25,
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
                        fontSize: 20,
                        color: AppPallete.mainGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      15.0), // Apply rounded corners to the whole stack
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Background image
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/scan.jpg', // Replace with your image path
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Elevated button with transparent background
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                          backgroundColor: Colors
                              .transparent, // Transparent to show the image
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onPressed: () {
                          context.go('/scan'); // Navigate to the scan page
                        },
                        child: const Text(
                          "Scan For Diseases",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppPallete.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      15.0), // Apply rounded corners to the whole stack
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Background image
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/user.png', // Replace with your image path
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Elevated button with transparent background
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                          backgroundColor: Colors
                              .transparent, // Transparent to show the image
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onPressed: () {
                          context
                              .go('/user_guide'); // Navigate to the scan page
                        },
                        child: const Text(
                          "User Guide",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppPallete.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
