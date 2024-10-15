import 'package:connectivity_plus/connectivity_plus.dart';

// Check for internet connectivity
Future<bool> hasInternetConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}
