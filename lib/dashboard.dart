import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class dashboard extends StatefulWidget {
  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Welcome to Dashboard"
        ),
      ),
      body:  Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(
              "Hello Welcome"
          ),
            IconButton(icon: Icon(Icons.logout), onPressed: (){

              FirebaseAuth.instance.signOut();
              //Navigator.pop(context);

            })
          ],
        )
      ),
    );
  }
}
