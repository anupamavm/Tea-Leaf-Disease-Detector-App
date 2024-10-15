import 'package:camera/camera.dart';

// Initialize the camera when the screen is first created
Future<CameraController?> initializeCamera() async {
  try {
    final cameras = await availableCameras(); // Get available cameras
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
