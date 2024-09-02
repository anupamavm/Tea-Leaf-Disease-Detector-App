import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

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

// Scan the captured image (stub function)
Future<void> scanImage(BuildContext context, XFile? capturedImage) async {
  try {
    if (capturedImage != null) {
      // TODO: Implement your scanning logic here

      await Future.delayed(const Duration(seconds: 2));

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
    print('Error scanning image: $e');
  }
}

// Retake a photo (clear the captured image)
void retakePhoto(Function setStateCallback) {
  setStateCallback();
}
