import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Screen'),
      ),
      body: Stack(
        children: [
          // Camera view
          Center(
            child: _imageCaptured
                ? Image.asset(
                    'assets/captured_image.jpg') // Display captured image
                : Text('Camera View'), // Placeholder for camera view
          ),
          // Buttons
          Positioned(
            left: 16,
            bottom: 16,
            child: IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                // Navigate to user guides screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserGuidesScreen()),
                );
              },
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: ElevatedButton(
              onPressed: _imageCaptured ? null : _captureImage,
              child: Text(_imageCaptured ? 'Scan' : 'Capture'),
            ),
          ),
        ],
      ),
    );
  }
}

class UserGuidesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Guides'),
      ),
      body: Center(
        child: Text('User Guides Screen'),
      ),
    );
  }
}
