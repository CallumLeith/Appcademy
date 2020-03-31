import 'package:appcademy_v1/models/user.dart';
import 'package:appcademy_v1/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
Future signInWithEmailAndPassword(String email, String password) async {
  try {
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user); 
  } catch(e) {
    print(e.toString());
    return null;
  }
}

//register with email & password
Future registerWithEmailAndPassword(String email, String password) async {
String errorMessage = '';

  try {
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;

    //create a new document for the user with the uid
    await DatabaseService(uid: user.uid).updateUserInfo('null', 'null', 'null');

    return _userFromFirebaseUser(user);
  } catch(e) {
    errorMessage = e.toString();
    print(errorMessage);
    return null;
    
    
  }
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
  await DatabaseService(uid: user.uid).updateUserInfo(firstName, surname, phoneNumer);
}
}