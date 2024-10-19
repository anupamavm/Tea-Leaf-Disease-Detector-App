import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> sendDataToServer(String imagePath, String location) async {
  try {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'http://192.168.8.125:5000/upload'), // Update with your backend URL
    );

    var file = await http.MultipartFile.fromPath('file', imagePath);
    request.files.add(file);
    request.fields['location'] = location;

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Data sent to server successfully');
    } else {
      print('Failed to send data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error sending data to server: $e');
  }
}
