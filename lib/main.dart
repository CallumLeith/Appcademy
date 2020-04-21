import 'package:appcademy_v1/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appcademy_v1/models/user.dart';
import 'package:appcademy_v1/services/validation/signed_in_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {

     return StreamProvider<User>.value(
       value: AuthService().user,
       child: MaterialApp(
      home: SignedIn(),
     )
     );
//return MaterialApp(
 //   title: 'text', 
  //  home: SignedInState(),
//);
  }
}


