import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              color: Theme.of(context).primaryColor,
              child: Column(
                children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                ),
              ],),
            ),
            FlatButton(
                  onPressed: null, 
                  child: Text('Study')
                )
          ],)
      );
  }
}