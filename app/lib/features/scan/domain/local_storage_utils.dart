import 'dart:io';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveOfflineData(XFile image, String prediction) async {
  final directory = await getApplicationDocumentsDirectory();
  final imagePath =
      '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
  await File(imagePath).writeAsBytes(await image.readAsBytes());

  final prefs = await SharedPreferences.getInstance();
  List<String> offlineData = prefs.getStringList('offline_predictions') ?? [];
  offlineData.add('$imagePath,$prediction');
  await prefs.setStringList('offline_predictions', offlineData);
}

Future<List<Map<String, String>>> loadOfflineData() async {
  final prefs = await SharedPreferences.getInstance();
  List<String> offlineData = prefs.getStringList('offline_predictions') ?? [];
  return offlineData.map((entry) {
    final splitData = entry.split(',');
    return {'imagePath': splitData[0], 'prediction': splitData[1]};
  }).toList();
}

Future<void> clearOfflineData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('offline_predictions');
}
