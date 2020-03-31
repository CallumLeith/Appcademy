import 'package:appcademy_v1/screens/authenticate/authenticate.dart';
import 'package:appcademy_v1/services/validation/user_information_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appcademy_v1/models/user.dart';
import 'package:appcademy_v1/screens/authenticate/user_information.dart';
import 'package:appcademy_v1/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignedInState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   final user = _getCurrentUser();
   print(user.toString()); //test

    //return either home or user information widget
    if (user == null) {
      print('Authenticate');
      return Authenticate();
    } else {
      print('User Information');
     final snapShot = checkifDocumentExists(user);
      print(snapShot.toString());
      if (snapShot == null) {
        print('User Information');
      return UserInformation();
      } else {
      print('Home');
      return Home();
    }
    }
  }
}

Future _getCurrentUser() async {
   final user = await FirebaseAuth.instance.currentUser();
   print(user);
   print(user.toString());
   return user;
    }



