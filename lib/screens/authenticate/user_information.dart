import 'package:appcademy_v1/services/auth.dart';
import 'package:appcademy_v1/shared/constants.dart';
import 'package:flutter/material.dart';

bool userinformation = false;

class UserInformation extends StatefulWidget {


  @override
  _userInformationState createState() => _userInformationState();
}

class _userInformationState extends State<UserInformation> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String firstName = '';
  String surname = '';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    //return loading ? Loading() : Scaffold(
      
      return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Sign In'),
      ),
      body: Container(
        decoration: gradientBackground,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'First Name'),
                validator: (val) => val.isEmpty ? 'Enter Your First Name' : null,
                onChanged: (val) {
                  setState(() => firstName = val.trim());
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Surname'),
                validator: (val) => val.isEmpty ? 'Enter Your Surname' : null,
                onChanged: (val) {
                  setState(() => surname = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Phone Number'),
                validator: (val) => val.length < 11 ? 'Enter Your Phone Number' : null,
                onChanged: (val) {
                  setState(() => phoneNumber = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.red,
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                _auth.updateUserInformation(firstName, surname, phoneNumber);
                //return _formKey.currentState.validate() ? Home() : null;    //CODE DOESNT WORK - WILL USE PUSH FOR NOW.  
               //  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                //return SignedIn();           
                }),
              SizedBox(height: 12.0), 
            ],
          ),
        )
      ),
    );
  }
  
}



// class UserInformation extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//         return Scaffold(
//       appBar: AppBar(
//         title: Text('User Information'),
//       ),
//       body: Center(
//         child: RaisedButton(
//           child: Text('Continue'),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => Home()),
//             );
//           },
//         ),
//       ),
//     );
//      }}
  

 