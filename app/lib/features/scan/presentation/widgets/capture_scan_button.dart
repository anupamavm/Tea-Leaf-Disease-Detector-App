import 'package:flutter/material.dart';

class CaptureScanButton extends StatelessWidget {
  final bool imageCaptured;
  final VoidCallback onCapturePressed;
  final VoidCallback onScanPressed;
  final Color buttonColor;
  final double width;
  final double height;

  const CaptureScanButton({
    super.key,
    required this.imageCaptured,
    required this.onCapturePressed,
    required this.onScanPressed,
    required this.buttonColor,
    this.width = 320, // Default button width
    this.height = 50, // Default button height
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: imageCaptured ? onScanPressed : onCapturePressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: buttonColor, // Set the custom button color
        ),
        child: Text(imageCaptured ? 'Scan' : 'Capture'),
      ),
    );
  }
}
