import 'package:student_side_bts/services/locationdb.dart';

class UserLocation {
  final double latitude;
  final double longitude;
  String route;
  String bussNo;
  

  UserLocation({this.latitude, this.longitude}){
    LocationDB(latitude,longitude);
  }
}