import 'package:flutter/material.dart';

class subscription extends StatefulWidget {
  @override
  _subscriptionState createState() => _subscriptionState();
}

class _subscriptionState extends State<subscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Subscription"),
      ),
      body: Column(
        children: <Widget> [
          SizedBox(height: 200,),
          
          RaisedButton(
            onPressed: null,
            child: Text("Subscribe"),
            color: Colors.red,
          )
        ] ,
      ),
      
    );
  }
}