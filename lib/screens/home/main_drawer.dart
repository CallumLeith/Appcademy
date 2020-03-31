import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(backgroundImage:  NetworkImage("https://i1.wp.com/codesundar.com/wp-content/uploads/2019/08/cropped-codesundar-favicon.png")),
            title: Text("codesundar"),
            subtitle: Text("me@codesundar.com"),
          ),
          ListTile(leading: Icon(Icons.home), title: Text("Home"), onLongPress: () {print('test');},),
          ListTile(leading: Icon(Icons.grid_on), title: Text("Products")),
          ListTile(leading: Icon(Icons.contacts), title: Text("Contact Us")),
        ],
      ));
  }
}