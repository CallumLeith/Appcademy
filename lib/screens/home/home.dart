import 'package:appcademy_v1/screens/home/main_drawer.dart';
import 'package:appcademy_v1/screens/home/grid_dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
String welcomeMessage = "";


void getData() async {
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  //var userQuery = await Firestore.instance.collection('userInfo').document(user.uid).get();
  var userQuery = Firestore.instance.collection('userInfo').document(user.uid);
      userQuery.get().then((data){ 
              setState(() {
                    welcomeMessage = ("Welcome " + data['firstName'] + ",");
                  });
          });
}


  @override

@override
void initState(){
   super.initState();
   getData();
}

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 236, 235, 1),
      appBar: AppBar(
        title: Text('Appcademy',
        style: TextStyle(color: Colors.red),
        textAlign: TextAlign.center),
        elevation: 0.0,
        backgroundColor: Color(0xFFEFEEEE),
        iconTheme: new IconThemeData(color: Colors.red),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(welcomeMessage, style: TextStyle(fontSize: 20.0),),
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

  //  welcomeMessage() {
  //     getData().then((val){
  //     if(val.documents.length > 0){
  //       setState(() {
  //     welcomeMessage = ("welcome " + val.documents[0].data["firstName"] + ",");
  //       });
  //     }
  //     else{
  //       setState(() {
  //     welcomeMessage = "Welcome,";
  //       });
  //      }
  //      });
  //      return welcomeMessage;
        
  // }

 

}
