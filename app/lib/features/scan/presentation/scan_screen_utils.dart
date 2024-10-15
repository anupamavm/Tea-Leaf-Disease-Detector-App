import 'package:app/features/scan/presentation/hugging_face_service.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:tflite_flutter/tflite_flutter.dart'; // Import TFLite
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart'; // Optional
import 'dart:developer' as developer;
import 'dart:io';
import 'package:image/image.dart' as img;

// Initialize the camera when the screen is first created
Future<CameraController?> initializeCamera() async {
  try {
    final cameras =
        await availableCameras(); // Get available cameras on the device
    final firstCamera = cameras.first; // Choose the first available camera

    CameraController cameraController = CameraController(
      firstCamera,
      ResolutionPreset.high, // Set the camera resolution
    );

    await cameraController.initialize();
    return cameraController; // Return the initialized controller
  } catch (e) {
    print('Error initializing camera: $e');
    return null;
  }
}

// Capture an image using the camera
Future<XFile?> captureImage(CameraController? cameraController) async {
  try {
    if (cameraController != null && cameraController.value.isInitialized) {
      final image = await cameraController.takePicture();
      return image; // Return the captured image
    }
  } catch (e) {
    print('Error capturing image: $e');
  }
  return null;
}

// Check for internet connectivity
Future<bool> hasInternetConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}

// Function to load and run TFLite model
Future<void> runTFLiteModel(XFile capturedImage) async {
  try {
    // Load the model from assets
    final interpreter = await Interpreter.fromAsset('model.tflite');

    // Load the image file
    File imageFile = File(capturedImage.path);
    img.Image image = img.decodeImage(imageFile.readAsBytesSync())!;

    // Resize the image to the input size required by the model
    img.Image resizedImage = img.copyResize(image, width: 224, height: 224);

    // Normalize the pixel values (0-255 to 0-1)
    var input = imageToTensor(resizedImage);

    // Prepare the output tensor
    var output = List.filled(1 * 1 * 4, 0.0)
        .reshape([1, 4]); // Adjust output size based on your model

    // Run inference
    interpreter.run(input, output);

    // Log the output
    developer.log('TFLite model prediction output: $output',
        name: 'TFLiteModel');

    // Dispose the interpreter to free resources
    interpreter.close();
  } catch (e) {
    developer.log('Error running TFLite model: $e', name: 'TFLiteModel');
  }
}

// Function to convert the image to a tensor
List<List<List<List<double>>>> imageToTensor(img.Image image) {
  List<List<List<List<double>>>> tensor = List.generate(
      1,
      (index) => List.generate(
          224,
          (y) => List.generate(224, (x) {
                int pixel = image.getPixel(x, y);
                return [
                  ((pixel >> 16) & 0xFF) / 255.0, // Red channel
                  ((pixel >> 8) & 0xFF) / 255.0, // Green channel
                  (pixel & 0xFF) / 255.0, // Blue channel
                ];
              }, growable: false),
          growable: false),
      growable: false);
  return tensor;
}

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

// Retake a photo (clear the captured image)
void retakePhoto(Function setStateCallback) {
  setStateCallback();
}
