import 'package:cloud_firestore/cloud_firestore.dart';

// class UserInformationState extends StatelessWidget {
//   @override
//   Widget build(BuildContext context)  {

//     final user = Provider.of<User>(context);
//     print(user);

//    checkifDocumentExists(user);
//   }

Future checkifDocumentExists(user) async {
   final snapShot = await Firestore.instance
  .collection('userInfo')
  .document(user.uid)
  .get();
  return snapShot;

}