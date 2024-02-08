import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class RequestTowingMap extends StatefulWidget {
  @override
  State<RequestTowingMap> createState() => _RequestTowingMapState();
}

class _RequestTowingMapState extends State<RequestTowingMap> {
  CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133, -122.081089), // Placeholder initial location
    zoom: 16.0,
  );
  Marker userLocationMarker = Marker(
    markerId: MarkerId('user_location'),
    position: LatLng(37.42796133, -122.081089), // Placeholder initial location
    icon: BitmapDescriptor.defaultMarker,
  );
  Set<Marker> markers = {};
  bool _locationPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    // Handle location permission request for Android (if applicable)
    Location location = Location();
    bool hasPermission = await location.serviceEnabled();
    PermissionStatus permissionStatus = await location.hasPermission();
    if (!hasPermission) {
      permissionStatus = await location.requestPermission();
    }
    _locationPermissionGranted = permissionStatus == PermissionStatus.granted;
    setState(() {});
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    if (_locationPermissionGranted) {
      Location location = Location();
      LatLng userLocation = (await location.getLocation()) as LatLng;

      setState(() {
        initialCameraPosition =
            CameraPosition(target: userLocation, zoom: 16.0);
        userLocationMarker = Marker(
          markerId: MarkerId('user_location'),
          position: userLocation,
          icon: BitmapDescriptor.defaultMarker,
        );
        markers = Set<Marker>.from([userLocationMarker]);
      });

      location.onLocationChanged.listen((newLocation) {
        setState(() {
          userLocationMarker = Marker(
            markerId: MarkerId('user_location'),
            position: LatLng(newLocation.latitude!, newLocation.longitude!),
            icon: BitmapDescriptor.defaultMarker,
          );
          markers = Set<Marker>.from([userLocationMarker]);
          initialCameraPosition = CameraPosition(
            target: LatLng(newLocation.latitude!, newLocation.longitude!),
            zoom: 16.0,
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Request Towing Map'),
        ),
        body: Stack(
          children: [
            GoogleMap(
              myLocationEnabled: _locationPermissionGranted,
              zoomControlsEnabled: true,
              initialCameraPosition: initialCameraPosition,
              onMapCreated: _onMapCreated,
              markers: markers,
            ),
            if (!_locationPermissionGranted)
              Center(
                child: Text('Location permission not granted'),
              ),
          ],
        ),
      ),
    );
  }
}
