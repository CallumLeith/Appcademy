import 'package:appcademy_v1/models/user.dart';
import 'package:appcademy_v1/screens/authenticate/user_information.dart';
import 'package:appcademy_v1/screens/home/home.dart';
import 'package:appcademy_v1/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class UserInformationState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return new StreamBuilder(
      stream: Firestore.instance.collection('userInfo').document(user.uid).snapshots(),
      builder: (context, snapshot) {
       if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data.exists == true) {
          return Home();      
        } else {
           return UserInformation();
        }
      } return Loading();
      }
  );



  }
}