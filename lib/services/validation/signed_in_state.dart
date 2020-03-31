import 'dart:math';

import 'package:appcademy_v1/screens/authenticate/authenticate.dart';
import 'package:appcademy_v1/services/validation/user_information_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:appcademy_v1/screens/authenticate/user_information.dart';
import 'package:appcademy_v1/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignedInState extends StatefulWidget {
  @override
  _SignedInStateState createState() => _SignedInStateState();
}

class _SignedInStateState extends State<SignedInState> {
  var user; // made user acessible to all class
  bool hasData = false;
  @override
  void initState() {
    super.initState();
    // call method when build is done
    SchedulerBinding.instance.addPostFrameCallback((_) => _getCurrentUser());
  }

  Future _getCurrentUser() async {
    user = await FirebaseAuth.instance.currentUser();
    print('user');
    setState(() {
      hasData = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!hasData) {
      return Container();
    } else if (user == null && hasData) {
      return Authenticate();
    } else {
      final snapShot = checkifDocumentExists(user);
      if (snapShot == null) {
        return UserInformation();
      } else {
        return Home();
      }
    }
  }
}



