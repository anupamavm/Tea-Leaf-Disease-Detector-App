import 'package:Drtealeaf/core/theme/app_pallete.dart';
import 'package:Drtealeaf/features/scan/domain/scan_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:camera/camera.dart';
import './widgets/camera_view.dart';
import './widgets/capture_scan_button.dart';
import '../domain/camera_utils.dart'; // Camera-related utilities
import '../domain/location_utils.dart'; // Location utilities

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  CameraController? _cameraController;
  XFile? _capturedImage;
  bool _imageCaptured = false;
  String? _location;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameraController = await initializeCamera();
      if (_cameraController != null) {
        setState(() {});
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  Future<void> _captureImage() async {
    try {
      final image = await captureImage(_cameraController);
      if (image != null) {
        setState(() {
          _capturedImage = image;
          _imageCaptured = true;
        });
      }
    } catch (e) {
      debugPrint('Error capturing image: $e');
    }
  }

  Future<void> _scanImage() async {
    if (_capturedImage != null) {
      try {
        // Get location before scanning
        _location = await getLocation();

        if (_location != null) {
          // Call scanImage and get prediction results
          var prediction = await scanImage(context, _capturedImage!, _location);

          // Show a dialog with the prediction result
          if (prediction != null) {
            String result = prediction['label'];
            double confidence = prediction['confidence'];

            // Show the prediction in a dialog box
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Prediction Result'),
                content: Text(
                  'Predicted: $result\nConfidence: ${confidence.toStringAsFixed(2)}',
                ),
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
        }
      } catch (e) {
        debugPrint('Error getting location or scanning image: $e');
      }

      setState(() {
        _imageCaptured = false;
        _capturedImage = null;
      });
    }
  }

  void _retakePhoto() {
    setState(() {
      _capturedImage = null;
      _imageCaptured = false;
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double cameraViewWidth = 400.0;
    double cameraViewHeight = 450.0;

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
                const Text(
                  'Scan for Diseases',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
          Center(
            child: _cameraController == null
                ? const CircularProgressIndicator()
                : CameraView(
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
                        IconButton(
                          icon: const Icon(Icons.replay,
                              color: AppPallete.mainGreen, size: 36),
                          onPressed: _retakePhoto,
                        ),
                        Expanded(
                          child: CaptureScanButton(
                            imageCaptured: _imageCaptured,
                            onCapturePressed: _captureImage,
                            onScanPressed: _scanImage,
                            buttonColor: AppPallete.mainGreen,
                          ),
                        ),
                      ],
                    )
                  : CaptureScanButton(
                      imageCaptured: _imageCaptured,
                      onCapturePressed: _captureImage,
                      onScanPressed: _scanImage,
                      buttonColor: AppPallete.mainGreen,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
