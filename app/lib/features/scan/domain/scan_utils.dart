import 'package:Drtealeaf/features/scan/presentation/results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'connectivity_utils.dart'; // Import connectivity utilities
// Import the ResultsPage for navigation

// Initialize the TFLite model
Future<void> _tfLteInit() async {
  try {
    debugPrint("Initializing TFLite model...");
    String? res = await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1, // defaults to 1
      isAsset:
          true, // defaults to true, set to false to load resources outside assets
      useGpuDelegate:
          false, // defaults to false, set to true to use GPU delegate
    );
    debugPrint("TFLite model loaded successfully: $res");
  } catch (e) {
    debugPrint("Error loading TFLite model: $e");
  }
}

// Run the TFLite model on the captured image
Future<List<dynamic>?> runTFLiteModel(XFile capturedImage) async {
  try {
    debugPrint("Running TFLite model on image: ${capturedImage.path}");
    var recognitions = await Tflite.runModelOnImage(
      path: capturedImage.path, // Image path is passed correctly
      imageMean: 0.0, // defaults to 117.0
      imageStd: 255.0, // defaults to 1.0
      numResults: 2, // defaults to 5
      threshold: 0.2, // defaults to 0.1
      asynch: true, // defaults to true
    );

    debugPrint("TFLite model predictions: $recognitions");

    // Return the recognitions (predictions)
    return recognitions;
  } catch (e) {
    debugPrint("Error during TFLite model prediction: $e");
    return null; // Return null if there is an error
  }
}

// Scan image function
Future<void> scanImage(
    BuildContext context, XFile? capturedImage, String? location) async {
  try {
    debugPrint("Starting scanImage function...");
    if (capturedImage != null) {
      debugPrint("Captured image path: ${capturedImage.path}");

      // Initialize model if not loaded
      await _tfLteInit();

      // Check internet connection
      debugPrint("Checking internet connection...");
      bool isConnected = await hasInternetConnection();

      // If there's no internet connection, use the local TFLite model
      if (!isConnected) {
        debugPrint("No internet connection. Running local TFLite model...");
        var predictions = await runTFLiteModel(
            capturedImage); // Run the local TFLite model and get predictions
        debugPrint("Predictions from TFLite model: $predictions");

        if (predictions != null && predictions.isNotEmpty) {
          // Assuming you want the first prediction result
          String result = predictions[0]['label'];
          double confidence = predictions[0]['confidence'];

          debugPrint("Prediction result: $result, Confidence: $confidence");

          // Navigate to ResultsPage and pass the prediction results
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsPage(
                result: result,
                confidence: confidence,
              ),
            ),
          );
        } else {
          debugPrint("No predictions found from TFLite model.");
        }
      } else {
        // If there's an internet connection, send the image to the server
        debugPrint("Internet connection detected. Sending image to server...");
        await sendDataToServer(capturedImage, location);
      }
    } else {
      debugPrint("Captured image is null.");
    }
  } catch (e) {
    debugPrint("Error in scanImage function: $e");
  }
}

Future<void> sendDataToServer(XFile capturedImage, String? location) async {
  try {
    // Ensure the captured image path is valid
    if (capturedImage.path.isNotEmpty &&
        location != null &&
        location.isNotEmpty) {
      // Prepare a multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://35.244.22.197/upload'), // Update with your backend URL
      );

      // Convert the image file to a multipart file
      var file = await http.MultipartFile.fromPath(
        'file', // The name of the file parameter in the backend
        capturedImage.path,
      );

      // Add the file and location fields to the request
      request.files.add(file);
      request.fields['location'] = location;

      // Send the request and wait for the response
      var response = await request.send();

      // Get the response body if needed
      var responseBody = await response.stream.bytesToString();

      // Handle the response
      if (response.statusCode == 200) {
        debugPrint('Data sent to server successfully');
        debugPrint('Server response: $responseBody');
      } else {
        debugPrint('Failed to send data. Status code: ${response.statusCode}');
        debugPrint('Error response: $responseBody');
      }
    } else {
      debugPrint('Invalid captured image path or location');
    }
  } catch (e) {
    debugPrint('Error sending data to server: $e');
  }
}
