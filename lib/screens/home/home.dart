import 'package:flutter/material.dart';
import 'package:student_side_bts/services/auth.dart';
import 'homeform.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Bus Tracker',style: TextStyle(color: Colors.black),),
        elevation: 4.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text(' Log Out'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: HomeForm(),
    );
  }
}
