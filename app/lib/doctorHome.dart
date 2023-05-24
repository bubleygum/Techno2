import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:apps/chatWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dbservices.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoctorHomeScreen(),
    );
  }
}

class DoctorHomeScreen extends StatelessWidget {
  DoctorHomeScreen({Key? key}) : super(key: key);
  final UserUID = FirebaseAuth.instance.currentUser?.uid;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Hello,"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.handHoldingHeart),
                    iconSize: 30,
                    color: Color.fromRGBO(0, 74, 173, 1),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChatPage(
                                chatId: "id",
                              )));
                    },
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Patient',
                      style: TextStyle(
                          fontSize: 10, color: Color.fromRGBO(0, 74, 173, 1)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: Database.getListPasien(UserUID),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('error');
              } else if (snapshot.hasData || snapshot.data != null) {
                List<DocumentSnapshot> patients = snapshot.data!.docs;
                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 8.0),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot patientDoc = patients[index];
                    String patientID = patientDoc.id;
                    String chatId = patientDoc["chatId"];
                    Timestamp jamMulai = patientDoc["jamMulai"];
                    Timestamp jamSelesai = patientDoc["jamSelesai"];
                    DateTime dateTimeMulai = jamMulai.toDate();
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Chat ID: $patientID",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(0, 74, 173, 1),
                              ),
                            ),
                            Text(
                              "Jam Mulai: $dateTimeMulai",
                              style: TextStyle(
                                color: Color.fromRGBO(0, 74, 173, 1),
                              ),
                            ),
                          ],
                        ),
                        // ...other card properties...
                      ),
                    );
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Color.fromRGBO(0, 74, 173, 1),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}