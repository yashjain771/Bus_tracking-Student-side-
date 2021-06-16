import 'dart:async';

import 'package:location/location.dart';
import 'package:student_side_bts/models/userlocation.dart';

class LocationService {
  UserLocation _currentLocation;

  var location = Location();

  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>();

  Stream<UserLocation> get locationStream => _locationController.stream;
  StreamSubscription<LocationData> ss;

  LocationService() {
    permission();
  }

  void permission() async {
    await location.requestPermission().then((granted) {
      if (granted != null) {
         
        ss= location.onLocationChanged().listen((locationData) {
          if (locationData != null) {
            _locationController.add(UserLocation(
              latitude: locationData.latitude,
              longitude: locationData.longitude,
            ));
           
          }
        });
      }
    });
  }

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }

    return _currentLocation;
  }
}
