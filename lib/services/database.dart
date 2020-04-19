import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

 //collection reference
 final CollectionReference userInfo = Firestore.instance.collection('userInfo');



 Future updateUserInfo(String firstName, String surname, String phoneNumber, String deviceID) async {
   return await userInfo.document(uid).setData({
     'firstName': firstName,
     'surname': surname,
     'phoneNumber': phoneNumber,
     'deviceID' : deviceID,
   });
 }
}