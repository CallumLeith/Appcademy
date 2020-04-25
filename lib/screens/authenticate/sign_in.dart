import 'package:appcademy_v1/services/auth.dart';
import 'package:appcademy_v1/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:appcademy_v1/shared/constants.dart';


class SignIn extends StatefulWidget {

 final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool deviceCheck = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';
  
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Appcademy", style: TextStyle(color: Colors.red)),
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        decoration: gradientBackground,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
           // crossAxisAlignment: CrossAxisAlignment.start,
           // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100.0),

              TextFormField(
      
                autocorrect: false,
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                onChanged: (val) {
                  setState(() => email = val.trim());
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                autocorrect: false,
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.length < 6 ? 'Password too short' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
               SizedBox(height: 40.0),
               SizedBox(
                width: double.infinity,
                height: 40,
                child: RaisedButton(
                color: Colors.red,
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: ()  async {
                  setState(() => loading = true);
                  if (_formKey.currentState.validate()) {
                      await checkDeviceID();
                      print(deviceCheck);
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password, deviceCheck);
                     

                      if(this.mounted) {
                      setState(() => loading = false);
                       } 
                    if (result != null) {
                      setState(() {
                      error = result;
                      loading = false;
                      });
                    // } else if (result == "This account is already registered with another device.") {
                    //   error = result;
                    // }
                  
                  }
                }}
              )
               ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              //Spacer(),
 
             

            ],
          ),


          
        )
      ),
    );
  }  
     checkDeviceID() async {

    final AuthService _auth = AuthService();    
  
    String deviceID = await _auth.getDeviceID();             //DEVICE CHECK                           //true = pass
                                                          //false = fail
    await Firestore.instance.collection('userInfo').getDocuments().then((val){
    if(val.documents.length > 0){
      print(deviceID);
      print(val.documents[0].data["deviceID"]);
    if (val.documents[0].data["deviceID"] == deviceID) {
      setState(() => deviceCheck = true);
  } 
     }});
     
     }
}
 

