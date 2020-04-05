import 'package:appcademy_v1/screens/authenticate/authenticate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:appcademy_v1/screens/authenticate/user_information.dart';
import 'package:appcademy_v1/screens/home/home.dart';
import 'package:appcademy_v1/models/user.dart';
import 'package:appcademy_v1/services/globals.dart';



class SignedIn extends StatefulWidget {
  @override
_SignedInState createState() => _SignedInState();
}

class _SignedInState extends State<SignedIn> {
  bool hasData = false;

  @override
   void initState() {
  super.initState();
  // call method when build is done
    SchedulerBinding.instance.addPostFrameCallback((_) => checkifDocumentExists());
    }

    Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    //print(user.uid);
  
    
  
//checkifDocumentExists();

     if (user == null) {
      return Authenticate();
    } else {
      checkifDocumentExists();
      if (hasData == false) {   
      return UserInformation();
      } else if (hasData == true){
        return Home();
      }
    }
  }


Future checkifDocumentExists() async {
  if (signInCounter < 2) {
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  signInCounter = signInCounter + 1;
  if (user != null) {
   print(user.uid.toString());
final DocumentSnapshot snapShot = await Firestore.instance.collection('userInfo').document(user.uid).get();
 if (snapShot.exists) {
  setState(() {
      hasData = true;
   });
} else {
   setState(() {
      hasData = false;
   });
}
}
}
}
}
// class _SignedInStateState extends State<SignedInState> {
//   dynamic user; // made user acessible to all class
//   bool hasData = false;
//   @override
 //  void initState() {
    // super.initState();
//     // call method when build is done
//     SchedulerBinding.instance.addPostFrameCallback((_) => _getCurrentUser());
//   }

//   Future _getCurrentUser() async {
//     user = await FirebaseAuth.instance.currentUser();
//     print('user');
//     setState(() {
//       hasData = true;
//     });
//   }
  




