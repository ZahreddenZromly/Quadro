import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class WrokshopLocation extends StatefulWidget {
  @override
  _WrokshopLocationState createState() => _WrokshopLocationState();
}

class _WrokshopLocationState extends State<WrokshopLocation> {
  GoogleMapController? _mapController;
  Set<Marker> _markers = Set();
  List<LatLng> _polylineCoordinates = [];
  PolylinePoints _polylinePoints = PolylinePoints();

  // Replace with your start location
  LatLng _startLocation =
  LatLng(32.867127, 13.251609); // Replace with your end location

  LatLng _endLocation = LatLng(32.862398, 13.243890);
  @override
  void initState() {
    super.initState();
    _addMarkers();
    _getPolyline();
  }

  void _addMarkers() {
    _markers.add(Marker(
      infoWindow: InfoWindow(
        title: 'Your Loacation', // Main text
        // snippet: '', // Brief description or hint
      ),
      markerId: MarkerId('start'),
      position: _endLocation,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),

      // infoWindow: InfoWindow(title: 'Starting Point'),
    ));

    _markers.add(Marker(
      markerId: MarkerId('end'),
      infoWindow: InfoWindow(
        title: 'ًًWorkshop Loacation', // Main text
        snippet: 'ورشة امجيد الششه', // Brief description or hint
      ),
      position: _startLocation,
    ));
  }

  Future<void> _getPolyline() async {
    PolylineResult result = await _polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyBpVjPdG8TAOhWQGTKYUYMXax-0eMDzRvs', // Replace with your actual API key
      PointLatLng(_startLocation.latitude, _startLocation.longitude),
      PointLatLng(_endLocation.latitude, _endLocation.longitude),
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
      appBar: AppBar(
        centerTitle: true,
        title: Text('WorkShop Route'),
      ),
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
          target:
          LatLng((32.867127 + 32.862398) / 2, (13.251609 + 13.243890) / 2),
          zoom: 15,
        ),
        onMapCreated: (controller) {
          _mapController = controller;
        },
      ),
    );
  }
}