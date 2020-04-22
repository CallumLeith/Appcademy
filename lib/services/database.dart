import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

 //collection reference
 final CollectionReference userInfo = Firestore.instance.collection('userInfo');
 final CollectionReference deviceID = Firestore.instance.collection('deviceID');


 Future updateUserInfo(String firstName, String surname, String phoneNumber) async {
   return await userInfo.document(uid).setData({
     'firstName': firstName,
     'surname': surname,
     'phoneNumber': phoneNumber,
   });
 }

 Future updateDeviceID(String userDevice) async {
   return await deviceID.document(uid).setData({
     'deviceID' : userDevice,
   });
 }
}