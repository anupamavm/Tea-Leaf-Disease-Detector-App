import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  LatLng? _currentPosition;
  final Set<Marker> _markers = {}; // Set to store all markers

  @override
  void initState() {
    super.initState();
    _getCurrentLocationAndFetchMarkers();
  }

  // Method to get the current location and fetch markers
  Future<void> _getCurrentLocationAndFetchMarkers() async {
    // Request location permissions
    var status = await Permission.location.request();
    if (status.isGranted) {
      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });

      // Move the map camera to the current location
      if (_mapController != null) {
        _mapController!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _currentPosition!,
            zoom: 21.0,
          ),
        ));
      }

      // Fetch locations and add markers
      _fetchLocationMarkers();
    } else {
      print('Location permission denied');
    }
  }

  // Method to fetch locations from the server and add markers
  Future<void> _fetchLocationMarkers() async {
    const String apiUrl = 'http://127.0.0.1/locations';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['locations'] is List) {
          List<String> locations = List<String>.from(data['locations']);

          setState(() {
            _markers.clear(); // Clear existing markers
            for (var location in locations) {
              try {
                List<String> latLng = location.split(',');
                if (latLng.length == 2) {
                  double latitude = double.parse(latLng[0].trim());
                  double longitude = double.parse(latLng[1].trim());

                  // Create a new marker
                  final marker = Marker(
                    markerId: MarkerId(location),
                    position: LatLng(latitude, longitude),
                    infoWindow: InfoWindow(
                      title: 'Marker at ($latitude, $longitude)',
                    ),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed,
                    ),
                  );

                  _markers.add(marker);
                }
              } catch (e) {
                print('Error parsing location: $location, Error: $e');
              }
            }
          });
        } else {
          print('Invalid data format: ${data['locations']}');
        }
      } else {
        print('Failed to load locations: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching locations: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentPosition!,
                zoom: 15.0,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              markers: _markers,
            ),
    );
  }
}
