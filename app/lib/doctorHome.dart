import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:apps/chatWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dbservices.dart';
import 'package:intl/intl.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Color.fromRGBO(0, 74, 173, 1)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Dashboard',
          style: TextStyle(color: Color.fromRGBO(0, 74, 173, 1)),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color.fromRGBO(144, 177, 222, 0.3),
      body: DoctorHomeScreen(),
    );
  }
}

class DoctorHomeScreen extends StatelessWidget {
  DoctorHomeScreen({Key? key}) : super(key: key);
  final UserUID = FirebaseAuth.instance.currentUser?.uid;
  void sessionOver(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Session is Over'),
          content: Text('The chat session has ended.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(),
        Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: Database.getListPasien(UserUID),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                      Color.fromRGBO(0, 74, 173, 1),
                    ),
                  ),
                );
              }
              int itemCount = snapshot.data!.docs.length;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.person),
                          iconSize: 20,
                          color: Color.fromRGBO(0, 74, 173, 1),
                          onPressed: () {},
                        ),
                        FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(children: <Widget>[
                              Text(
                                "Patients",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(0, 74, 173, 1),
                                ),
                              ),
                              Text(
                                '$itemCount',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromRGBO(0, 74, 173, 1),
                                ),
                              ),
                            ])),
                      ],
                    ),
                  ),
                  Container(
                    child: StreamBuilder<DocumentSnapshot>(
                      stream: Database.getDoctorDetail(UserUID),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                              Color.fromRGBO(0, 74, 173, 1),
                            ),
                          );
                        }
                        DocumentSnapshot data = snapshot.data!;
                        int harga = data["hargaSesi"];
                        int pendapatan = itemCount * harga;
                        return Container(
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                icon: FaIcon(FontAwesomeIcons.moneyBill),
                                iconSize: 20,
                                color: Color.fromRGBO(0, 74, 173, 1),
                                onPressed: () {},
                              ),
                              FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Column(children: <Widget>[
                                    Text(
                                      "Income",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromRGBO(0, 74, 173, 1),
                                      ),
                                    ),
                                    Text(
                                      '$pendapatan',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(0, 74, 173, 1),
                                      ),
                                    ),
                                  ])),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Text("Your Patients:"),
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
                    DateTime dateTimeSelesai = jamSelesai.toDate();
                    String formatMulai =
                        DateFormat('dd-MM-yyyy HH:mm').format(dateTimeMulai);
                    String formatSelesai =
                        DateFormat('dd-MM-yyyy HH:mm').format(dateTimeSelesai);

                    return StreamBuilder<DocumentSnapshot>(
                      stream: Database.getPatientData(patientID),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return ListTile(
                            title: Text('Loading...'),
                          );
                        } else if (snapshot.hasError) {
                          return Text('error');
                        } else if (snapshot.hasData) {
                          DocumentSnapshot doc = snapshot.data!;
                          String nama = doc["username"];

                          return Card(
                            elevation: 5,
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Nama: $nama",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(0, 74, 173, 1),
                                    ),
                                  ),
                                  Text(
                                    "Jam Mulai: $formatMulai",
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 74, 173, 1),
                                    ),
                                  ),
                                  Text(
                                    "Jam Selesai: $formatSelesai",
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 74, 173, 1),
                                    ),
                                  ),
                                  ElevatedButton(
                                      child: Text('Chat'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(0, 74, 173, 1),
                                      ),
                                      onPressed: () {
                                        // if (status == true) {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChatPage(
                                                          chatId: chatId,
                                                          time: jamSelesai)));
                                        // }else{
                                        //   sessionOver(context);
                                        // }
                                      }),
                                ],
                              ),
                            ),
                          );
                        }

                        return Container(); // Return an appropriate widget here
                      },
                    );
                  },
                );
              }

              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
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
