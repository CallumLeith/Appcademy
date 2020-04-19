import 'package:appcademy_v1/screens/authenticate/authenticate.dart';
import 'package:appcademy_v1/services/validation/user_information_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appcademy_v1/models/user.dart';




class SignedIn extends StatefulWidget {
  @override
_SignedInState createState() => _SignedInState();
}

class _SignedInState extends State<SignedIn> {
  bool hasData = false;



  @override
  

    Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    //print(user.uid);
    


     if (user == null) {
      return Authenticate();
      } else {
        return UserInformationState();
      }
    } 
  }


// Future checkifDocumentExists() async {
//   if (signInCounter < 2) {
//   final FirebaseUser user = await FirebaseAuth.instance.currentUser();
//   signInCounter = signInCounter + 1;
//   if (user != null) {
//    print(user.uid.toString());
// final DocumentSnapshot snapShot = await Firestore.instance.collection('userInfo').document(user.uid).get();
//  if (snapShot.exists) {
//   setState(() {
//       hasData = true;
//    });
// } else {
//    setState(() {
//       hasData = false;
//    });
// }
// }
// }
// }

// class _SignedInStateState extends State<SignedInState> {
//   dynamic user; // made user acessible to all class
//   bool hasData = false;
//   @override
 //  void initState() {
    // super.initState();
//     // call method when build is done
//     SchedulerBinding.instance.addPostFrameCallback((_) => _getCurrentUser());
//   }


  




