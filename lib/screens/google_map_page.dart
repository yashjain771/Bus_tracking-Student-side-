// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:student_side_bts/services/location_provider.dart';

// class GoogleMapPage extends StatefulWidget {
//   @override
//   _GoogleMapPageState createState() => _GoogleMapPageState();
// }

// class _GoogleMapPageState extends State<GoogleMapPage> {
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<LocationProvider>(context, listen: false).initalization();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Live Tracking"),
//       ),
//       body: googleMapUI(),
//     );
//   }
// }

// Widget googleMapUI() {
//   return Consumer<LocationProvider>(builder: (consumerContext, model, child) {
//     if (model.locationPosition != null) {
//       return Column(
//         children: [
//           Expanded(
//             child: GoogleMap(
//               mapType: MapType.terrain,
//               initialCameraPosition: CameraPosition(
//                 target: model.locationPosition,
//                 zoom: 18,
//               ),
//               myLocationEnabled: true,
//               myLocationButtonEnabled: true,
//               onMapCreated: (GoogleMapController controller) {},
//             ),
//           )
//         ],
//       );
//     }
//     return Container(
//       child: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   });
// }
