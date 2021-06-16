import 'package:flutter/material.dart';
import 'package:student_side_bts/screens/Maps/mapscreen.dart';
import 'package:student_side_bts/services/database.dart';
import 'package:student_side_bts/services/rootform.dart';
import 'package:student_side_bts/shared/constants.dart';
import 'package:student_side_bts/shared/lists.dart';

class HomeForm extends StatefulWidget {
  @override
  _HomeFormState createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  final _formKey = GlobalKey<FormState>();
   RouteDb obj =RouteDb();
  String _busNo;
  String _route;
  // List<String> data;
  updateData(String route, String busNo) {
    print("Button");
    DatabaseService(route, busNo);
  }

  @override
  Widget build(BuildContext context) {
    // Stream.periodic(Duration(milliseconds: 10000), (i) {
    //  data= RouteDb().getBusData();
    // });

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            DropdownButtonFormField(
              hint: Text("Select Bus NO."),
              value: _busNo,
              decoration: textInputDecoration,
              items: buses.map((bus) {
                return DropdownMenuItem(
                  value: bus,
                  child: Text('$bus'),
                );
              }).toList(),
              onChanged: (val) => setState(() => _busNo = val),
            ),
            SizedBox(height: 20.0),
            FlatButton(
                height: 50.0,
                minWidth: 335.0,
                color: Colors.blueGrey[700],
                child: Text(
                  '     Start tracking     ',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MapScreen(_busNo)));
                }),
          ],
        ),
      ),
    );
  }
}
