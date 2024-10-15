import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

Future<void> sendImageToHuggingFace(XFile image) async {
  try {
    // Convert image to bytes
    final bytes = await image.readAsBytes();

    // Create a multipart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://api-inference.huggingface.co/models/YOUR_MODEL_PATH'), // Replace with your model path
    );

    // Add your Hugging Face API token (if required)
    request.headers['Authorization'] =
        'Bearer YOUR_API_TOKEN'; // Replace with your API token

    // Attach the image file to the request
    request.files.add(
      http.MultipartFile.fromBytes(
        'file', // The key used for the image file in your model
        bytes,
        filename: 'image.jpg',
      ),
    );

    // Send the request
    var response = await request.send();

    // Check the response status
    if (response.statusCode == 200) {
      // Convert the response into a string
      final responseData = await response.stream.bytesToString();

      // Parse the response (assuming JSON format)
      final jsonResponse = json.decode(responseData);
      debugPrint('Prediction: $jsonResponse');
    } else {
      debugPrint(
          'Failed to get prediction. Status Code: ${response.statusCode}');
    }
  } catch (e) {
    debugPrint('Error sending image to Hugging Face: $e');
  }
}
