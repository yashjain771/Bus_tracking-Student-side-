
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_side_bts/models/userlocation.dart';
import 'package:student_side_bts/screens/home/tracking.dart';
import 'package:student_side_bts/services/location_service.dart';

class Track extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
      initialData: null,
      create: (context) => LocationService().locationStream,
      child: TrackingMap(),
    );
  }
}
