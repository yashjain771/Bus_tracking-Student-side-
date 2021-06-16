import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:provider/provider.dart';

class MapPage extends StatefulWidget {
  String busNo;

  MapPage(String busNo) {
    this.busNo = busNo;
  }
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController mapController;
  Map<String, dynamic> busData = {'G1': null, 'G2': null, 'G3': null};
  @override
  Widget build(BuildContext context) {
    final routes = Provider.of<QuerySnapshot>(context);
    LatLng loc;
    String bus = widget.busNo;
    for (var doc in routes.documents) {
      busData[doc.data["busno"]] = doc.data;
    }
    print(busData);

    if (busData != null) {
      print(" yeee ");
      loc = LatLng(busData["$bus"]["latitude"], busData["$bus"]["longitude"]);
    }

    return Stack(
      children: [
        SafeArea(
          child: GoogleMapsWidget(
            apiKey: "AIzaSyDGXM26vq5DmilJyMQ4AzE8IKf7_S4xMyA",
            // sourceLatLng: LatLng(22.951091, 75.6441445),
            // destinationLatLng: LatLng(22.751091, 75.3441445),
            sourceLatLng: LatLng(40.484000837597925, -3.369978368282318),
            destinationLatLng: LatLng(40.48017307700204, -3.3618026599287987),
            defaultCameraLocation: loc,
            routeWidth: 2,
            // sourceMarkerIconInfo: MarkerIconInfo(
            //   assetPath: "images/house-marker-icon.png",
            // ),
            // destinationMarkerIconInfo: MarkerIconInfo(
            //   assetPath: "images/restaurant-marker-icon.png",
            // ),
            driverMarkerIconInfo: MarkerIconInfo(
              assetPath: "images/driver-marker-icon.png",
              assetMarkerSize: Size.square(125),
            ),
            driverCoordinatesStream:
                Stream.periodic(Duration(milliseconds: 500), (i) {
              print("i=" + i.toString());
              print(busData["$bus"]["latitude"].toString() +
                  " " +
                  busData["$bus"]["longitude"].toString());
              return LatLng(
                busData["$bus"]["latitude"],
                busData["$bus"]["longitude"],
              );
            }),
            sourceName: "This is source name",
            driverName: bus,
            onTapDriverMarker: (currentLocation) {
              print("Driver is currently at $currentLocation");
            },
            totalTimeCallback: (time) => print(time),
            totalDistanceCallback: (distance) => print(distance),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            compassEnabled: true,
            mapToolbarEnabled: true,
          ),
        ),
      ],
    );
  }
}
