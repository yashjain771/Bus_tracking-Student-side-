import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_side_bts/screens/Maps/MapPage.dart';
import 'package:student_side_bts/services/location_provider.dart';
import 'package:student_side_bts/services/rootform.dart';

class MapScreen extends StatelessWidget with ChangeNotifier{
  final String busNo;
  MapScreen(this.busNo);
  init(){
    LocationProvider();
  }
  @override
  Widget build(BuildContext context) {
    return 
      StreamProvider<QuerySnapshot>.value(
        initialData: null,
        value: RouteDb().routes,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            "Acrobus",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: MapPage(busNo),
      ),
    );
  }
}
