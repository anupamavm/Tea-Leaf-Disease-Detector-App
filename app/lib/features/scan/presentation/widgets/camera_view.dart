import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraView extends StatelessWidget {
  final CameraController? cameraController;
  final XFile? capturedImage;
  final double width;
  final double height;

  const CameraView({
    super.key,
    required this.cameraController,
    required this.capturedImage,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: capturedImage != null
          ? Image.file(
              File(capturedImage!.path), // Display the captured image
              width: width,
              height: height,
              fit: BoxFit.cover,
            )
          : (cameraController != null && cameraController!.value.isInitialized)
              ? CameraPreview(cameraController!) // Display live camera feed
              : const Center(
                  child:
                      CircularProgressIndicator(), // Show loading indicator while the camera is initializing
                ),
    );
  }
}
