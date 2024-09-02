import 'package:app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:go_router/go_router.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

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
                FlutterMap(
                  options: MapOptions(
                    // Commented out center and zoom to avoid errors
                    // center: LatLng(7.151648, 80.748949), // Initial map center coordinates
                    // zoom: 9.0, // Initial zoom level
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: const ['a', 'b', 'c'],
                    ),
                  ],
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