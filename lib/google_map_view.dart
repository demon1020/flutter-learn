import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'detail_view.dart';
import 'main.dart';

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({super.key});

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  GoogleMapController? mapController;
  BitmapDescriptor? customIcon;

  setCustomIcons() async{
    // Load the custom marker icon
    customIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty, // Icon size
      'assets/location_black.png', // Path to your custom marker image
    );
  }
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void disableStatusBar({bool disable = true}) {
    if (disable) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
          overlays: [SystemUiOverlay.bottom]);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
          overlays: SystemUiOverlay.values);
    }
  }

  @override
  void initState() {
    super.initState();
    setCustomIcons();
    // Disable the status bar when entering the map screen
    disableStatusBar();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    // Re-enable the status bar when leaving the map screen
    disableStatusBar(disable: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Google Maps Integration'),
      // ),
      body: SafeArea(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(37.7749, -122.4194),
            zoom: 15.0,
          ),
          markers: {
            // Simple Marker
            Marker(
              markerId: MarkerId('marker_1'),
              position: LatLng(37.7749, -122.4194),
              infoWindow: InfoWindow(title: 'Simple Marker'),
            ),

            // Custom Marker with an Icon
            Marker(
              markerId: MarkerId('marker_2'),
              position: LatLng(37.7749, -122.4097),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
              infoWindow: InfoWindow(title: 'Custom Marker'),
            ),

            // Clickable Marker with Custom Action
            Marker(
              markerId: MarkerId('marker_3'),
              position: LatLng(37.7849, -122.4194),
              infoWindow: InfoWindow(title: 'Clickable Marker'),
              icon: customIcon ?? BitmapDescriptor.defaultMarker,
              onTap: () {
                // Custom action when the marker is tapped, e.g., navigate to a new screen.
                Navigator.of(navigatorKey.currentContext!).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailsScreen(markerId: 'marker_3');
                    },
                  ),
                );
              },
            ),
          },
        ),
      ),
    );
  }
}
