import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:apps/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Therapy extends StatelessWidget {
  const Therapy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: theraphy(),
    );
  }
}

class theraphy extends StatelessWidget {
  theraphy({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.directions_transit,
                    ),
                    iconSize: 30,
                    color: Colors.black,
                    onPressed: () {},
                  ),
                  Text('Therapy', style: TextStyle(fontSize: 10.0),),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.school,
                    ),
                    iconSize: 30,
                    color: Colors.green,
                    onPressed: () {},
                  ),
                  Text('School', style: TextStyle(fontSize: 10.0),),
                ],
              ),
            ),
          ]),
    );
  }
}
