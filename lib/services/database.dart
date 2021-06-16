
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final CollectionReference userColl = Firestore.instance.collection("users");
  String uid;
  String _route;
  String _busNo;
  final FirebaseAuth auth = FirebaseAuth.instance;

  DatabaseService(String route, String busNo) {
    this._route = route;
    this._busNo = busNo;

    inputData();
  }
  inputData() async {
    final FirebaseUser user = await auth.currentUser();
    this.uid = user.uid;
    print(uid);
    updateUserData();
    updateData(_route, _busNo);
   
  }

  Future updateUserData() async {
    return await userColl.document(uid).setData({
      "busno": null,
      "route": null,
      "latitude": 0.0,
      "longitude": 0.0,
    });
  }

  Future updateData(String route, String busNo) async {
    print(uid);
    return await userColl.document(uid).updateData({
      "busno": busNo,
      "route": route,
    });
  }

  Future updateLocation(double lat, double long) async {
    print(uid);
    return await userColl.document(uid).updateData({
      "latitude": lat,
      "longitude": long,
    });
  }
}
