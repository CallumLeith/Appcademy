import 'package:appcademy_v1/screens/authenticate/authenticate.dart';
import 'package:appcademy_v1/screens/home/main_drawer.dart';
import 'package:appcademy_v1/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Subjects'),
        actions: <Widget>[
          FlatButton.icon(onPressed: () async {
            await _auth.signOut();
            Navigator.pop(context);
          },
            icon: Icon(Icons.person),
            label: Text('Logout')),
        ],
      ),
      drawer: MainDrawer(),
      body: Center(
        //BODY OF THE APP GOES HERE
      ),
      );
  }
}