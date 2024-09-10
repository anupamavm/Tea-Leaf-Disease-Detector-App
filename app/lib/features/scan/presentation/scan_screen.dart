// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:camera/camera.dart';
// import './widgets/camera_view.dart';
// import './widgets/capture_scan_button.dart';
// import 'package:app/core/theme/app_pallete.dart';
//
// class ScanScreen extends StatefulWidget {
//   @override
//   _ScanScreenState createState() => _ScanScreenState();
// }
//
// class _ScanScreenState extends State<ScanScreen> {
//   CameraController? _cameraController;
//   XFile? _capturedImage;
//   bool _imageCaptured = false;
//
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera(); // Initialize the camera when the screen is first created
//   }
//
//   Future<void> _initializeCamera() async {
//     try {
//       final cameras =
//           await availableCameras(); // Get available cameras on the device
//       final firstCamera = cameras.first; // Choose the first available camera
//
//       _cameraController = CameraController(
//         firstCamera,
//         ResolutionPreset.high, // Set the camera resolution
//       );
//
//       await _cameraController?.initialize();
//       setState(() {}); // Refresh the UI after the camera is initialized
//     } catch (e) {
//       print('Error initializing camera: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     _cameraController
//         ?.dispose(); // Dispose of the camera controller to release resources
//     super.dispose();
//   }
//
//   Future<void> _captureImage() async {
//     try {
//       if (_cameraController != null && _cameraController!.value.isInitialized) {
//         final image = await _cameraController!.takePicture();
//
//         setState(() {
//           _capturedImage = image;
//           _imageCaptured = true; // Mark that an image has been captured
//         });
//       }
//     } catch (e) {
//       print('Error capturing image: $e');
//     }
//   }
//
//   Future<void> _scanImage() async {
//     try {
//       if (_capturedImage != null) {
//         // TODO: Implement your scanning logic here
//
//         await Future.delayed(Duration(seconds: 2));
//
//         setState(() {
//           _imageCaptured = false;
//           _capturedImage = null; // Clear the captured image
//         });
//
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text('Scan Complete'),
//             content: Text('The disease scan is complete.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     } catch (e) {
//       print('Error scanning image: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double cameraViewWidth = 400.0; // Customize the width of the camera view
//     double cameraViewHeight = 450.0; // Customize the height of the camera view
//
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.info, size: 36),
//                   onPressed: () {
//                     GoRouter.of(context).go('/user_guide');
//                   },
//                 ),
//                 Spacer(), // Spacer to push the title to the center
//                 Text(
//                   'Scan for diseases',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Spacer(flex: 2), // Adjust spacer to balance the layout
//               ],
//             ),
//           ),
//           Center(
//             child: CameraView(
//               cameraController: _cameraController,
//               capturedImage: _capturedImage,
//               width: cameraViewWidth,
//               height: cameraViewHeight,
//             ),
//           ),
//           Spacer(),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Center(
//               child: CaptureScanButton(
//                 imageCaptured: _imageCaptured,
//                 onCapturePressed: _captureImage,
//                 onScanPressed: _scanImage,
//                 buttonColor: AppPallete.mainGreen,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:camera/camera.dart';
import 'package:geolocator/geolocator.dart';
import './widgets/camera_view.dart';
import './widgets/capture_scan_button.dart';
import 'package:app/core/theme/app_pallete.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  CameraController? _cameraController;
  XFile? _capturedImage;
  bool _imageCaptured = false;
  String? _location; // Store the user's location

  @override
  void initState() {
    super.initState();
    _initializeCamera(); // Initialize the camera when the screen is first created
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras =
      await availableCameras(); // Get available cameras on the device
      final firstCamera = cameras.first; // Choose the first available camera

      _cameraController = CameraController(
        firstCamera,
        ResolutionPreset.high, // Set the camera resolution
      );

      await _cameraController?.initialize();
      setState(() {}); // Refresh the UI after the camera is initialized
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _cameraController
        ?.dispose(); // Dispose of the camera controller to release resources
    super.dispose();
  }

  Future<void> _captureImage() async {
    try {
      if (_cameraController != null && _cameraController!.value.isInitialized) {
        final image = await _cameraController!.takePicture();

        setState(() {
          _capturedImage = image;
          _imageCaptured = true; // Mark that an image has been captured
        });
      }
    } catch (e) {
      print('Error capturing image: $e');
    }
  }

  Future<void> _getLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Check if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      // Check if the app has location permissions
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location permissions are permanently denied.');
      }

      // If permissions are granted, get the user's current location
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _location =
        'Lat: ${position.latitude}, Long: ${position.longitude}'; // Store the location
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  Future<void> _scanImage() async {
    try {
      if (_capturedImage != null) {
        await _getLocation(); // Get the user's location before scanning

        // TODO: Implement your scanning logic here

        await Future.delayed(Duration(seconds: 2));

        setState(() {
          _imageCaptured = false;
          _capturedImage = null; // Clear the captured image
        });

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Scan Complete'),
            content: Text(
                'The disease scan is complete.\nLocation: $_location'), // Display the location
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print('Error scanning image: $e');
    }
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
                  icon: Icon(Icons.info, size: 36),
                  onPressed: () {
                    GoRouter.of(context).go('/user_guide');
                  },
                ),
                Spacer(), // Spacer to push the title to the center
                Text(
                  'Scan for diseases',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(flex: 2), // Adjust spacer to balance the layout
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
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: CaptureScanButton(
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





