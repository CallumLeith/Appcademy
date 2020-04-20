import 'package:appcademy_v1/services/auth.dart';
import 'package:appcademy_v1/shared/loading.dart';
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
               SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              Spacer(),
              RaisedButton(
                color: Colors.red,
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: ()  async {
                  setState(() => loading = true);
                  if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(this.mounted) {
                      setState(() => loading = false);
                       } //ERROR OCCURS HERE
                    if (result == null) {
                      setState(() {
                      error = 'Could not sign in with those credentials';
                      loading = false;
                      });
                    } else if (result == "This account is already registered with another device.") {
                      error = result;
                    }
                  }
                },
              ),
             

            ],
          ),


          
        )
      ),
    );
  }
}