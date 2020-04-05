import 'package:appcademy_v1/screens/home/main_drawer.dart';
import 'package:appcademy_v1/screens/home/grid_dashboard.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appcademy',
        style: TextStyle(color: Colors.red),
        textAlign: TextAlign.center),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.red),
        centerTitle: true,
        // actions: <Widget>[
        //   FlatButton.icon(onPressed: () async {
        //     await _auth.signOut();
        //     if (userinformation == true) {
        //     Navigator.pop(context);
        //     userinformation = false;
        //     }
        //     signInCounter = 0;
        //   },
        //     icon: Icon(Icons.person),
        //     label: Text('Logout')),
        // ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Welcome,', style: TextStyle(fontSize: 25.0),),
                    SizedBox(height: 4,),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    ""
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(height: 5,),
          GridDashboard()
        ],
        //BODY OF THE APP GOES HERE
      ),
      );
  }
}