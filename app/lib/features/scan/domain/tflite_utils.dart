import 'dart:developer' as developer;
import 'dart:io';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

// Function to load and run TFLite model
Future<void> runTFLiteModel(capturedImage) async {
  try {
    // Load the model from assets
    final interpreter = await Interpreter.fromAsset('model.tflite');

    // Load the image file
    File imageFile = File(capturedImage.path);
    img.Image image = img.decodeImage(imageFile.readAsBytesSync())!;

    // Resize the image to the input size required by the model
    img.Image resizedImage = img.copyResize(image, width: 224, height: 224);

    // Normalize the pixel values (0-255 to 0-1)
    var input = imageToTensor(resizedImage);

    // Prepare the output tensor
    var output = List.filled(1 * 1 * 4, 0.0).reshape([1, 4]);

    // Run inference
    interpreter.run(input, output);

    // Log the output
    developer.log('TFLite model prediction output: $output',
        name: 'TFLiteModel');

    // Dispose the interpreter to free resources
    interpreter.close();
  } catch (e) {
    developer.log('Error running TFLite model: $e', name: 'TFLiteModel');
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
