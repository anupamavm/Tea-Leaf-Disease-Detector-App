import 'dart:developer' as developer;
import 'dart:io';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

// Function to load and run TFLite model
Future<String> runTFLiteModel(capturedImage) async {
  try {
    // Load the model from assets
    final interpreter = await Interpreter.fromAsset('model_unquant.tflite');

    // Load and process labels
    final labels = await loadLabels('assets/labels.txt');

    // Load the image file
    File imageFile = File(capturedImage.path);
    img.Image image = img.decodeImage(imageFile.readAsBytesSync())!;

    // Resize the image to the input size required by the model
    img.Image resizedImage = img.copyResize(image, width: 224, height: 224);

    // Normalize the pixel values (0-255 to 0-1)
    var input = imageToTensor(resizedImage);

    // Prepare the output tensor with appropriate size (1x4 for 4 classes)
    var output = List.filled(1 * 4, 0.0).reshape([1, 4]);

    // Run inference
    interpreter.run(input, output);

    // Close interpreter to free resources
    interpreter.close();

    // Find the index with the highest score
    int maxIndex = output[0].indexWhere(
        (score) => score == output[0].reduce((a, b) => a > b ? a : b));
    String predictedLabel = labels[maxIndex];

    developer.log('TFLite model prediction: $predictedLabel',
        name: 'TFLiteModel');
    return predictedLabel; // Return the predicted label
  } catch (e) {
    developer.log('Error running TFLite model: $e', name: 'TFLiteModel');
    return 'Error in prediction';
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
      }),
    ),
  );
  return tensor;
}

// Function to load labels from assets
Future<List<String>> loadLabels(String path) async {
  final labelData = await rootBundle.loadString(path);
  return labelData.split('\n');
}
