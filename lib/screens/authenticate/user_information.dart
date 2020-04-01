import 'package:appcademy_v1/screens/home/home.dart';
import 'package:flutter/material.dart';


class UserInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Continue'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
      ),
    );
     }}
  //   return loading ? Loading() : Scaffold(
  //     backgroundColor: Colors.white,
  //     appBar: AppBar(
  //       backgroundColor: Colors.red,
  //       elevation: 0.0,
  //       title: Text('Register'),
  //     ),
  //     body: Container(
  //       padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
  //       child: Form(
  //         key: _formKey,
  //         child: Column(
  //           children: <Widget>[
  //             SizedBox(height: 20.0),
  //             TextFormField(
  //               decoration: textInputDecoration.copyWith(hintText: 'First Name'),
  //               validator: (val) => val.isEmpty ? 'Enter Your Name.' : null,
  //               onChanged: (val) {
  //                 setState(() => firstName = val);
  //               },
  //             ),
  //             SizedBox(height: 20.0),
  //             TextFormField(
  //               decoration: textInputDecoration.copyWith(hintText: 'Surname'),
  //               validator: (val) => val.length < 6 ? 'Enter Your Surname' : null,
  //               obscureText: true,
  //               onChanged: (val) {
  //                 setState(() => surname = val);
  //               },
  //             ),
  //             SizedBox(height: 20.0),
  //             TextFormField(
  //               decoration: textInputDecoration.copyWith(hintText: 'Phone Number'),
  //               validator: (val) => val.length < 6 ? 'Enter Your Phone Number' : null,
  //               obscureText: true,
  //               onChanged: (val) {
  //                 setState(() => phoneNumber = val);
  //               },
  //             ),
  //             SizedBox(height: 20.0),
  //             RaisedButton(
  //               color: Colors.red,
  //               child: Text(
  //                 'Register',
  //                 style: TextStyle(color: Colors.white),
  //               ),
  //               onPressed: ()  async {
  //                 if (_formKey.currentState.validate()) {
  //                   setState(() => loading = true);
  //                   dynamic result = await _auth.updateUserInformation(firstName, surname, phoneNumber);
  //                   if (result == null) {
  //                     setState(() { 
  //                       error = 'Error with updating User Information';
  //                     loading = false;
  //                     });
  //                   }
  //                 }
  //               },
  //             ),
  //             SizedBox(height: 12.0),
  //             Text(
  //               error,
  //               style: TextStyle(color: Colors.red, fontSize: 14.0),
  //             )

  //           ],
  //         ),
  //       )
  //     ),
  //   );
  // }

 