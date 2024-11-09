import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:camera/camera.dart';
import './widgets/camera_view.dart';
import './widgets/capture_scan_button.dart';
import 'package:app/core/theme/app_pallete.dart';

// Import the newly split utility files
import '../domain/camera_utils.dart'; // Camera-related utilities
import '../domain/scan_utils.dart'; // Scan-related utilities

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  CameraController? _cameraController;
  XFile? _capturedImage;
  bool _imageCaptured = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera(); // Initialize the camera when the screen is first created
  }

  Future<void> _initializeCamera() async {
    _cameraController = await initializeCamera();
    if (_cameraController != null) {
      setState(() {}); // Refresh the UI after the camera is initialized
    }
  }

  Future<void> _captureImage() async {
    final image = await captureImage(_cameraController);
    if (image != null) {
      setState(() {
        _capturedImage = image;
        _imageCaptured = true; // Mark that an image has been captured
      });
    }
  }

  // Add the retake function
  void _retakePhoto() {
    setState(() {
      _capturedImage = null; // Clear the captured image
      _imageCaptured = false; // Allow user to capture again
    });
  }

  @override
  void dispose() {
    _cameraController
        ?.dispose(); // Dispose of the camera controller to release resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double cameraViewWidth = 400.0; // Customize the width of the camera view
    double cameraViewHeight = 450.0; // Customize the height of the camera view

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.info, size: 36),
                  onPressed: () {
                    GoRouter.of(context).go('/user_guide');
                  },
                ),
                const Spacer(), // Spacer to push the title to the center
                const Text(
                  'Scan for diseases',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(flex: 2), // Adjust spacer to balance the layout
              ],
            ),
          ),
          Center(
            child: CameraView(
              cameraController: _cameraController,
              capturedImage: _capturedImage,
              width: cameraViewWidth,
              height: cameraViewHeight,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: _imageCaptured
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Retake Button with an Icon
                        IconButton(
                          icon: const Icon(Icons.replay,
                              color: AppPallete.mainGreen, size: 36),
                          onPressed: _retakePhoto,
                        ),
                        // Scan Button
                        Expanded(
                          child: CaptureScanButton(
                            imageCaptured: _imageCaptured,
                            onCapturePressed: _captureImage,
                            onScanPressed: () => scanImage(
                                context, _capturedImage), // Call scanImage
                            buttonColor: AppPallete.mainGreen,
                          ),
                        ),
                      ],
                    )
                  : CaptureScanButton(
                      imageCaptured: _imageCaptured,
                      onCapturePressed: _captureImage,
                      onScanPressed: () =>
                          scanImage(context, _capturedImage), // Call scanImage
                      buttonColor: AppPallete.mainGreen,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
