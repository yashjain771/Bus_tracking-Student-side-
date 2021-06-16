
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_side_bts/shared/lists.dart';

class RouteDb {
  final CollectionReference userColl = Firestore.instance.collection("users");
  // BusModel obj;
  String uid;
  // List<String> busRoute;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  RouteDb() {
    // obj=BusModel();
  }

  // getBusData() async {
  //   busRoute.removeRange(0, buses.length);
  //   QuerySnapshot data = await userColl.getDocuments();
  //   for (var doc in data.documents) {
  //     if(!buses.contains(doc.data['busno'])){
  //       busRoute.add(doc.data['busno'].toString()+"("+doc.data['route'].toString()+")");
  //     }
      
  //   }
  //   return busRoute;
  // }

  Stream<QuerySnapshot> get routes {
    return userColl.snapshots();
  }
}
