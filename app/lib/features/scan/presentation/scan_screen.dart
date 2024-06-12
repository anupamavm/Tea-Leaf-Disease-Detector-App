import 'package:app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  // Variable to track whether an image has been captured
  bool _imageCaptured = false;

  // Function to handle capturing an image
  void _captureImage() {
    // TODO: Implement image capture functionality
    // Set _imageCaptured to true after capturing the image
    setState(() {
      _imageCaptured = true;
    });
  }

  // Function to handle scanning
  void _scanImage() {
    // TODO: Implement scan functionality
    // Perform scan operations here
    // For now, let's reset _imageCaptured to false
    setState(() {
      _imageCaptured = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double cameraViewWidth = 400.0; // Customize the width of the camera view
    double cameraViewHeight = 450.0; // Customize the height of the camera view

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.info, size: 36),
                  onPressed: () {
                    // Navigate to user guides screen
                    GoRouter.of(context).go('/user_guide');
                  },
                ),
                Spacer(), // Spacer to push the title to the center
                Text(
                  'Scan for diseases',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(flex: 2), // Adjust spacer to balance the layout
              ],
            ),
          ),
          Center(
            child: Container(
              width: cameraViewWidth,
              height: cameraViewHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Colors.black, // Set the border color
                  width: 2.0, // Set the border width
                ),
              ),
              child: _imageCaptured
                  ? Image.asset(
                      'assets/captured_image.jpg', // Display captured image
                      width: cameraViewWidth,
                      height: cameraViewHeight,
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: Text('Camera View'), // Placeholder for camera view
                    ),
            ),
          ),
          Spacer(), // Push buttons to the bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SizedBox(
                width: 320, // Set the desired width of the button
                height: 50, // Set the desired height of the button
                child: ElevatedButton(
                  onPressed: _imageCaptured ? _scanImage : _captureImage,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppPallete.whiteColor,
                    backgroundColor:
                        AppPallete.mainGreen, // Set the custom button color
                  ),
                  child: Text(_imageCaptured ? 'Scan' : 'Capture'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
