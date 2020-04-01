import 'package:appcademy_v1/screens/authenticate/authenticate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:appcademy_v1/screens/authenticate/user_information.dart';
import 'package:appcademy_v1/screens/home/home.dart';
import 'package:appcademy_v1/models/user.dart';


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



     if (user == null) {
      return Authenticate();
    } else {
      
      if (hasData == false) {
        return UserInformation();
      } else {
        return Home();
      }
    }
  }


Future checkifDocumentExists() async {
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();

  if (user != null) {
   print(user.uid.toString());
final snapShot = await Firestore.instance.collection('userInfo').document(user.uid).get();
if(snapShot.exists){
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
  




