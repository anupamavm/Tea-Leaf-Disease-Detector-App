import 'dart:io';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as img; // Import the image package

// Initialize the camera when the screen is first created
Future<CameraController?> initializeCamera() async {
  try {
    final cameras = await availableCameras(); // Get available cameras
    if (cameras.isEmpty) {
      print('No cameras found');
      return null;
    }

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

// Capture an image using the camera and convert it to JPG format
Future<XFile?> captureImage(CameraController? cameraController) async {
  try {
    if (cameraController != null && cameraController.value.isInitialized) {
      final image = await cameraController.takePicture(); // Capture the image

      // Convert the captured image to JPEG format
      final jpegImage = await _convertToJpg(image);
      return jpegImage; // Return the converted image in JPEG format
    } else {
      print('Camera controller is not initialized');
    }
  } catch (e) {
    print('Error capturing image: $e');
  }
  return null;
}

// Convert an image to JPG format and save it with a .jpg extension
Future<XFile?> _convertToJpg(XFile image) async {
  try {
    final bytes = await image.readAsBytes(); // Read image as bytes
    img.Image? originalImage = img.decodeImage(bytes); // Decode the image

    if (originalImage != null) {
      // Encode the image to JPG format
      final jpgBytes = img.encodeJpg(originalImage);

      // Create a new file path with .jpg extension
      final jpgFilePath =
          image.path.replaceAll(RegExp(r'\.(png|heic|jpeg)$'), '.jpg');

      // Save the JPEG image to a new file
      final File jpgFile = File(jpgFilePath);
      await jpgFile.writeAsBytes(jpgBytes);

      // Return the new JPEG image as an XFile
      return XFile(jpgFile.path);
    } else {
      print('Failed to decode image');
    }
  } catch (e) {
    print('Error converting image to JPG: $e');
  }
  return null;
}
