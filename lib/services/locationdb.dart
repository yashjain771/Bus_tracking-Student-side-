import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LocationDB{
  final CollectionReference userColl = Firestore.instance.collection("users");

  String uid;
  double _lat;
  double _long;
  final FirebaseAuth auth = FirebaseAuth.instance;
  LocationDB(double lat , double long){
    this._lat=lat;
    this._long=long;
    inputData();
  }

  inputData() async {
    final FirebaseUser user = await auth.currentUser();
    this.uid = user.uid;
    print(uid);
    updateLocation(_lat,_long);
    
  }

  Future updateLocation(double lat, double long) async {
    print(uid);
    return await userColl.document(uid).updateData({
      "latitude": lat,
      "longitude": long,
    });
  }
}