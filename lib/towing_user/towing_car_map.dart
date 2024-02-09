import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class RequestTowingMap extends StatefulWidget {
  @override
  _RequestTowingMapState createState() => _RequestTowingMapState();
}

class _RequestTowingMapState extends State<RequestTowingMap> {
  GoogleMapController? _mapController;
  Set<Marker> _markers = Set();
  List<LatLng> _polylineCoordinates = [];
  PolylinePoints _polylinePoints = PolylinePoints();

  LatLng _destinationLocation =
  LatLng(32.856056, 13.246905); // Replace with your start location
  LatLng _carLocation =
  LatLng(32.867127, 13.251609); // Replace with your end location
  LatLng _towLocation =
  LatLng(32.850764, 13.23870); // Replace with your end location

  @override
  void initState() {
    super.initState();
    _addMarkers();
    _getPolyline();
    // _getPolyline1();
  }

  void _addMarkers() {
    _markers.add(Marker(
      infoWindow: InfoWindow(
        title: 'Destination Point', // Main text
        snippet: '123 Main St, City', // Brief description or hint
      ),
      markerId: MarkerId('Car Location'),
      position: _destinationLocation,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      // infoWindow: InfoWindow(title: 'Starting Point'),
    ));

    _markers.add(Marker(
      markerId: MarkerId('Destination Location'),
      position: _carLocation,
      infoWindow: InfoWindow(title: 'Destination Point'),
    ));
    _markers.add(
      Marker(
        markerId: MarkerId('YourLocation'),
        position: _towLocation,
        infoWindow: InfoWindow(title: 'Destination Point'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
    );
  }

  Future<void> _getPolyline() async {
    PolylineResult result = await _polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyBpVjPdG8TAOhWQGTKYUYMXax-0eMDzRvs', // Replace with your actual API key
      PointLatLng(
          _destinationLocation.latitude, _destinationLocation.longitude),
      PointLatLng(_towLocation.latitude, _towLocation.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      setState(() {
        _polylineCoordinates = result.points
            .map((PointLatLng point) => LatLng(point.latitude, point.longitude))
            .toList();
      });
    }
  }

  Future<void> _getPolyline1() async {
    PolylineResult result = await _polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyBpVjPdG8TAOhWQGTKYUYMXax-0eMDzRvs', // Replace with your actual API key
      PointLatLng(_carLocation.latitude, _carLocation.longitude),
      PointLatLng(_towLocation.latitude, _towLocation.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      setState(() {
        _polylineCoordinates = result.points
            .map((PointLatLng point) => LatLng(point.latitude, point.longitude))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Route Directions')),
      body: GoogleMap(
        markers: _markers,
        polylines: Set<Polyline>.from([
          Polyline(
            polylineId: PolylineId('route'),
            points: _polylineCoordinates,
            color: Colors.blue,
            width: 5,
          ),
        ]),
        initialCameraPosition: CameraPosition(
          target: _towLocation,
          zoom: 13,
        ),
        onMapCreated: (controller) {
          _mapController = controller;
        },
      ),
    );
  }
}