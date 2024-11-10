import 'package:Drtealeaf/features/scan/presentation/results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'connectivity_utils.dart'; // Import connectivity utilities
import 'dart:convert';
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

Future<void> scanImage(
    BuildContext context, XFile? capturedImage, String? location) async {
  try {
    if (capturedImage != null) {
      await _tfLteInit();
      bool isConnected = await hasInternetConnection();

      if (!isConnected) {
        var predictions = await runTFLiteModel(capturedImage);
        if (predictions != null && predictions.isNotEmpty) {
          String result = predictions[0]['label'];
          double confidence = predictions[0]['confidence'];
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
        // Send image to server and get response
        var serverResponse = await sendDataToServer(capturedImage, location);
        if (serverResponse != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsPage(
                result: serverResponse['disease'],
                confidence: serverResponse['score'] *
                    100, // convert to percentage if needed
              ),
            ),
          );
        }
      }
    } else {
      debugPrint("Captured image is null.");
    }
  } catch (e) {
    debugPrint("Error in scanImage function: $e");
  }
}

Future<Map<String, dynamic>?> sendDataToServer(
    XFile capturedImage, String? location) async {
  try {
    if (capturedImage.path.isNotEmpty &&
        location != null &&
        location.isNotEmpty) {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://35.244.22.197/upload'),
      );

      var file = await http.MultipartFile.fromPath('file', capturedImage.path);
      request.files.add(file);
      request.fields['location'] = location;

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('Data sent to server successfully');
        var jsonResponse = json.decode(responseBody);

        // Extract disease and score from the response
        return {
          'disease': jsonResponse['huggingface_result']['disease'],
          'score': jsonResponse['huggingface_result']['score'],
        };
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
  return null;
}
