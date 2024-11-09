import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:camera/camera.dart';

Future<void> _tfLteInit() async {
  try {
    debugPrint("Initializing TFLite model...");
    String? res = await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1, // defaults to 1
      isAsset:
          true, // defaults to true, set to false to load resources outside assets
      useGpuDelegate:
          false, // defaults to false, set to true to use GPU delegate
    );
    debugPrint("TFLite model loaded successfully: $res");
  } catch (e) {
    debugPrint("Error loading TFLite model: $e");
  }
}

Future<List<dynamic>?> runTFLiteModel(XFile capturedImage) async {
  try {
    debugPrint("Running TFLite model on image: ${capturedImage.path}");
    var recognitions = await Tflite.runModelOnImage(
      path: capturedImage.path, // Image path is passed correctly
      imageMean: 0.0, // defaults to 117.0
      imageStd: 255.0, // defaults to 1.0
      numResults: 2, // defaults to 5
      threshold: 0.2, // defaults to 0.1
      asynch: true, // defaults to true
    );

    debugPrint("TFLite model predictions: $recognitions");

    // Return the recognitions (predictions)
    return recognitions;
  } catch (e) {
    debugPrint("Error during TFLite model prediction: $e");
    return null; // Return null if there is an error
  }
}
