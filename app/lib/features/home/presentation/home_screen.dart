import 'package:app/core/theme/app_pallete.dart';
import 'package:app/features/home/presentation/widgets/disease_card.dart';
import 'package:app/features/home/presentation/widgets/user_guide_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First row: Greeting and profile picture
            Container(
              padding: const EdgeInsets.all(
                  16), // Add padding for space around the content
              decoration: const BoxDecoration(
                color: AppPallete.mainGreen, // Set background color

                borderRadius: BorderRadius.only(
                  bottomLeft:
                      Radius.circular(25), // Top corners remain unchanged
                  bottomRight:
                      Radius.circular(25), // Top corners remain unchanged
                  topLeft: Radius.zero, // Bottom left corner has no radius
                  topRight: Radius.zero, // Bottom right corner has no radius
                ), // Set border radius
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hello, User!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                        'assets/profile_picture.jpg'), // Update with your image path
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
                  Text(
                    "About Diseases",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to the "All Diseases" page here
                      context.go('/all-products');
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppPallete.mainGreen, // or any color you prefer
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // const SizedBox(height: 16),

            // Second row: Horizontally scrollable cards
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  DiseaseCard(
                    title: 'Card 1',
                    description: 'Description for card 1',
                  ),
                  DiseaseCard(
                    title: 'Card 2',
                    description: 'Description for card 1',
                  ),
                  DiseaseCard(
                    title: 'Card 3',
                    description: 'Description for card 1',
                  ),
                  DiseaseCard(
                    title: 'Card 4',
                    description: 'Description for card 1',
                  ),
                  DiseaseCard(
                    title: 'Card 5',
                    description: 'Description for card 1',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Third row: Another component
            const Expanded(
              child: UserGuideCard(),
            ),
          ],
        ),
      ),
    );
  }
}
