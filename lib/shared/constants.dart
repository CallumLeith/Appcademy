import 'package:flutter/material.dart';

const textInputDecoration =  InputDecoration(
                  filled: true,
                // fillColor: Color.fromRGBO(255, 242, 242, 1),
                fillColor: Colors.white,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red),
                  ),
                  enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2.5),
                  )
                );

const gradientBackground = BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 1],
            colors: [Colors.white, Color.fromRGBO(255, 235, 235, 1)]
          )
        );