import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TowingLocator extends StatefulWidget {
  @override
  _TowingLocatorState createState() => _TowingLocatorState();
}

class _TowingLocatorState extends State<TowingLocator> {
  GoogleMapController? _mapController;
  Set<Marker> _markers = Set();
  LatLng _initialLocation = LatLng(32.867127, 13.251609); // Initial location

  void _onMarkerDragEnd(LatLng newPosition) {
    // Handle the new marker position (e.g., save it to a variable)
    print('New marker position: $newPosition');
  }

  @override
  void initState() {
    super.initState();
    _addMarker();
  }

  void _addMarker() {
    _markers.add(Marker(
      markerId: MarkerId('draggableMarker'),
      position: LatLng(32.867127, 13.251609),
      draggable: true, // Make the marker draggable
      onDragEnd: _onMarkerDragEnd, // Handle marker drag end
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              minimumSize: MaterialStateProperty.all(const Size(250, 60.0)),
              // iconColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.teal),
            ),
            child: const Text(
              'Confirm',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      appBar:
      AppBar(centerTitle: true, title: Text('Draggable Marker Example')),
      body: GoogleMap(
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(32.867127, 13.251609),
          zoom: 14.0,
        ),
        onMapCreated: (controller) {
          _mapController = controller;
        },
      ),
    );
  }
}