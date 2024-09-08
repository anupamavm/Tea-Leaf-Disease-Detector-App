import 'package:app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:go_router/go_router.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;

  // Set initial position to a location
  final LatLng _initialPosition = LatLng(7.151648, 80.748949); // Adjust to your initial coordinates

  // Define a set of markers
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();

    // Add a marker at the initial position
    _markers.add(
      Marker(
        markerId: MarkerId('initial_position'),
        position: _initialPosition,
        infoWindow: InfoWindow(
          title: 'Initial Position',
          snippet: 'This is where the map is initially centered.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Disease Distribution Map',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 9.0,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: false,
                  markers: _markers, // Add the markers to the map
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppPallete.mainGreen,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.history,
                          color: AppPallete.whiteColor),
                      onPressed: () {
                        GoRouter.of(context).go('/history');
                      },
                      iconSize: 30.0,
                      tooltip: 'Go to History',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
