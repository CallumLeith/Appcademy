import 'package:flutter/material.dart';
import 'package:appcademy_v1/services/auth.dart';
import 'package:appcademy_v1/services/globals.dart';
import 'package:appcademy_v1/screens/authenticate/user_information.dart';

class MainDrawer extends StatelessWidget {

  final AuthService _auth = AuthService();
  
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
        children: <Widget>[
          Expanded(
            // ListView contains a group of widgets that scroll inside the drawer
            child: ListView(
              children: <Widget>[
                //MAIN MENUS HERE
              ],
            ),
          ),
          // This container holds the align
          Container(
              // This align moves the children to the bottom
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  // This container holds all the children that will be aligned
                  // on the bottom and should not scroll with the above ListView
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                          leading: Icon(Icons.settings),
                          onTap: null,
                          title: Text('Settings'),
                      ),
                      ListTile(
                          leading: Icon(Icons.person),
                          onTap: () async {
                        
            await _auth.signOut();
            if (userinformation == true) {
            Navigator.pop(context);
            userinformation = false;
            }
            signInCounter = 0;
          },
                          title: Text('Log Out')),
                      
                    ],
                  )
                )
              )
            )
        ],
      ),);
  }
}