import 'package:flutter/material.dart';
import 'camera_utils.dart';
import 'connectivity_utils.dart';
import 'tflite_utils.dart';
import 'package:app/features/scan/data/hugging_face_service.dart';
import 'package:camera/camera.dart';
import 'local_storage_utils.dart'; // Import utility to save/load data locally

// Function to handle the scanning process
Future<void> scanImage(BuildContext context, XFile? capturedImage) async {
  try {
    if (capturedImage != null) {
      // Check internet connection
      // bool isConnected = await hasInternetConnection();
      bool isConnected = false;

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
                onPressed: () async {
                  Navigator.of(context).pop();
                  // Run the local TFLite model and get the prediction
                  String prediction = await runTFLiteModel(capturedImage);

                  // Save the image and prediction locally
                  await saveOfflineData(capturedImage, prediction);

                  // Show the prediction result
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Local Model Prediction'),
                      content: Text('Predicted disease: $prediction'),
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
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
        return;
      }

      // If connected to the internet, send the image to the Flask API
      // String prediction = await sendImageToFlaskAPI(capturedImage);
      String prediction = "blister";

      // Show completion message with prediction
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Scan Complete'),
          content: Text('Predicted disease: $prediction'),
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
