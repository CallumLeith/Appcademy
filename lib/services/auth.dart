import 'package:appcademy_v1/models/user.dart';
import 'package:appcademy_v1/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  //create user obj based in FireBaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser); //Simplified version of code above
  }


//sign in with email & password
Future signInWithEmailAndPassword(String email, String password, bool deviceCheck) async {
  String errorMessage;

  

    if (deviceCheck == true) {
      FirebaseUser user;

try {
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      user = result.user;
    //deviceCheck = false;
    } catch (error) {
    switch (error.code) {
      case "ERROR_INVALID_EMAIL":
        errorMessage = "Your email address appears to be malformed.";
        return (errorMessage);
        break;
      case "ERROR_WRONG_PASSWORD":
        errorMessage = "Your password is wrong.";
        return (errorMessage);
        break;
      case "ERROR_USER_NOT_FOUND":
        errorMessage = "User with this email doesn't exist.";
        return (errorMessage);
        break;
      case "ERROR_USER_DISABLED":
        errorMessage = "User with this email has been disabled.";
        return (errorMessage);
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        errorMessage = "Too many requests. Try again later.";
        return (errorMessage);
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        errorMessage = "Signing in with Email and Password is not enabled.";
        return (errorMessage);
        break;
      default:
        errorMessage = "An undefined Error happened.";
        return (errorMessage);
    }
  }
     
    
  
    return _userFromFirebaseUser(user);

  }else {
    //RETURN ERROR STATING USER ALREADY HAS A REGISTERED DEVICE
     errorMessage = "This account is already registered with another device.";
     return (errorMessage);
  }}
        
          
        //register with email & password
        Future registerWithEmailAndPassword(String email, String password) async {
        String errorMessage = '';
        FirebaseUser user;
           

          try {
            //return _userFromFirebaseUser(user);
              AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
               user = result.user;
          } catch (error) {
    switch (error.code) {
      case "ERROR_OPERATION_NOT_ALLOWED":
        errorMessage = "Anonymous accounts are not enabled";
        return (errorMessage);
        break;
      case "ERROR_WEAK_PASSWORD":
        errorMessage = "Your password is too weak";
        return (errorMessage);
        break;
      case "ERROR_INVALID_EMAIL":
        errorMessage = "Your email is invalid";
        return (errorMessage);
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        errorMessage = "Email is already in use on different account";
        return (errorMessage);
        break;
      case "ERROR_INVALID_CREDENTIAL":
        errorMessage = "Your email is invalid";
        return (errorMessage);
        break;

      default:
        errorMessage = "An undefined Error happened.";
        return (errorMessage);
    }
  }

  return _userFromFirebaseUser(user);
        }
        
        //sign out
        Future signOut() async {
          try {
            return await _auth.signOut();
          } catch(e){
            print(e.toString());
            return null;
          }}
        
        Future updateUserInformation(String firstName, String surname, String phoneNumer) async {
          FirebaseUser user = await _auth.currentUser();
          String userDeviceID = await getDeviceID();
               
          if (userDeviceID == null) {
            //RETURN ERROR MESSAGE
          } else {
          await DatabaseService(uid: user.uid).updateUserInfo(firstName, surname, phoneNumer);
          await DatabaseService(uid: user.uid).updateDeviceID(userDeviceID);
          }
        }
        
        Future<String> getDeviceID() async {
          DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
          if (Platform.isIOS == TargetPlatform.iOS) {
            IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
            return iosDeviceInfo.identifierForVendor; // unique ID on iOS
          } else {
            AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
            return androidDeviceInfo.androidId; // unique ID on Android
          }
        }

        
    }
      
    