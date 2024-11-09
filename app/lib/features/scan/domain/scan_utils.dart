import 'package:flutter/material.dart';
import 'connectivity_utils.dart'; // Import connectivity utilities
import 'tflite_utils.dart'; // Import TFLite utilities
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> scanImage(
    BuildContext context, XFile? capturedImage, String? location) async {
  try {
    debugPrint("Starting scanImage function...");
    if (capturedImage != null) {
      debugPrint("Captured image path: ${capturedImage.path}");

      // Check internet connection
      bool isConnected = true;

      debugPrint("Checking internet connection...");
      if (!isConnected) {
        debugPrint("No internet connection. Running local TFLite model...");
        // Run the local TFLite model and get predictions
        var predictions = await runTFLiteModel(capturedImage);
        debugPrint("Predictions from TFLite model: $predictions");

        if (predictions != null && predictions.isNotEmpty) {
          // Assuming you want the first prediction result
          String result = predictions[0]['label'];
          double confidence = predictions[0]['confidence'];

          debugPrint("Prediction result: $result, Confidence: $confidence");

          return {
            'label': result,
            'confidence': confidence
          }; // Return the result
        } else {
          debugPrint("No predictions found from TFLite model.");
        }
      } else {
        debugPrint("Internet connection detected. Sending image to server...");
        // If online, proceed with server-based scanning
        await sendImageToServer(capturedImage, location);
      }
    } else {
      debugPrint("Captured image is null.");
    }
  } catch (e) {
    debugPrint("Error in scanImage function: $e");
  }
  return null; // Return null if there was an error or no result
}

Future<void> sendImageToServer(XFile image, String? location) async {
  try {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://34.47.208.64:80/upload'));
    request.fields['location'] = location ?? '';
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    var response = await request.send();
    if (response.statusCode == 200) {
      debugPrint('Image sent successfully!');
    } else {
      debugPrint('Failed to send image. Status code: ${response.statusCode}');
    }
  } catch (e) {
    debugPrint("Error sending image to server: $e");
  }
}
