import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:SEBL_MYLoan/colors.dart';

class LocationPage extends StatefulWidget {
  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Set<Marker> _markers = {};
  BitmapDescriptor? customIcon;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomIcon();
  }

  void getCustomIcon() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 1,
        ),
        'assets/images/sebl.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(Utils.mapStyle);
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(23.80266186100601, 90.41336075529372),
          icon: customIcon!,
          infoWindow: InfoWindow(
            title: 'SouthEast Bank Ltd',
            snippet: 'SouthEast Bank Ltd',
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('id-2'),
          position: LatLng(23.759306066835247, 90.41198746428574),
          icon: customIcon!,
          infoWindow: InfoWindow(
            title: 'SouthEast Bank Ltd',
            snippet: 'SouthEast Bank Ltd',
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('id-3'),
          position: LatLng(23.77313122312198, 90.42846695638146),
          icon: customIcon!,
          infoWindow: InfoWindow(
            title: 'SouthEast Bank Ltd',
            snippet: 'SouthEast Bank Ltd',
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('id-4'),
          position: LatLng(23.760562959922666, 90.41061417327775),
          icon: customIcon!,
          infoWindow: InfoWindow(
            title: 'SouthEast Bank Ltd',
            snippet: 'SouthEast Bank Ltd',
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('id-5'),
          position: LatLng(23.760562959922666, 90.41267410978972),
          icon: customIcon!,
          infoWindow: InfoWindow(
            title: 'SouthEast Bank Ltd',
            snippet: 'SouthEast Bank Ltd',
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('id-6'),
          position: LatLng(23.741079753352, 90.38108841660625),
          icon: customIcon!,
          infoWindow: InfoWindow(
            title: 'SouthEast Bank Ltd',
            snippet: 'SouthEast Bank Ltd',
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('id-7'),
          position: LatLng(23.728489985264687, 90.41667606951088),
          icon: customIcon!,
          infoWindow: InfoWindow(
            title: 'SouthEast Bank Ltd',
            snippet: 'SouthEast Bank Ltd',
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('id-8'),
          position: LatLng(23.798686853415326, 90.37923910333211),
          icon: customIcon!,
          infoWindow: InfoWindow(
            title: 'SouthEast Bank Ltd',
            snippet: 'SouthEast Bank Ltd',
          ),
        ),
      );      _markers.add(
        Marker(
          markerId: MarkerId('id-9'),
          position: LatLng(23.769363283426262, 90.41031313109778),
          icon: customIcon!,
          infoWindow: InfoWindow(
            title: 'SouthEast Bank Ltd',
            snippet: 'SouthEast Bank Ltd',
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.bottomSheetBG,
        title: Text('Location'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(23.80266186100601, 90.41336075529372),
          zoom: 12,
        ),
      ),
    );
  }
}

class Utils {
  static String mapStyle = '''
  [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]
''';
}
