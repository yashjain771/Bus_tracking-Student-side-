import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_side_bts/screens/wrapper.dart';
import 'package:student_side_bts/services/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
