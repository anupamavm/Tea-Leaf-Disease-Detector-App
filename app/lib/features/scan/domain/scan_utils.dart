import 'package:flutter/material.dart';
import 'camera_utils.dart'; // Import the camera utilities
import 'connectivity_utils.dart'; // Import connectivity utilities
import 'tflite_utils.dart'; // Import TFLite utilities
import 'package:app/features/scan/data/hugging_face_service.dart';
import 'package:camera/camera.dart';

// Function to handle the scanning process
Future<void> scanImage(BuildContext context, XFile? capturedImage) async {
  try {
    if (capturedImage != null) {
      // Check internet connection
      bool isConnected = await hasInternetConnection();

      if (!isConnected) {
        // Show a warning about using the local model
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('No Internet Connection'),
            content: const Text(
                'The app will use a local model for prediction, which may have less accuracy.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Run the local TFLite model after the alert
                  runTFLiteModel(capturedImage);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
        return;
      }

      // If connected to the internet, send the image to the Hugging Face model
      await sendImageToHuggingFace(capturedImage);

      // Show completion message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Scan Complete'),
          content: const Text('The disease scan is complete.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  } catch (e) {
    debugPrint('Error scanning image: $e');
  }
}

// Function to retake a photo (clear the captured image)
void retakePhoto(Function setStateCallback) {
  setStateCallback();
}
