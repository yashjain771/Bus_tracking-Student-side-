import 'package:flutter/material.dart';
import 'package:student_side_bts/services/auth.dart';
import 'package:student_side_bts/shared/constants.dart';
import 'package:student_side_bts/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  // text filled state
  String email = '';
  String password = '';
  String error = '';

  authService() => AuthService();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 3.0,
              title: Text('Sign In ', style: TextStyle(color: Colors.black)),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Register',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    widget.toggleView();
                  },
                )
              ],
            ),
            body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an Email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        validator: (val) => val.length < 6
                            ? 'Atleast 6 characters required'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 40.0),
                      FlatButton(
                          minWidth: 320.0,
                          height: 50.0,
                          color: Colors.yellow[500],
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 18),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      'Could not Sign In with those credentials';
                                  loading = false;
                                });
                              }
                            }
                          }),
                      SizedBox(height: 12.20),
                      Text(error,
                          style: TextStyle(color: Colors.red, fontSize: 16.0))
                    ],
                  ),
                )),
          );
  }
}
