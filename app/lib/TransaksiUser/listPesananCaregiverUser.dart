import 'package:apps/chatWidget.dart';
import 'package:apps/schoolDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/home.dart';

import '../dbservices.dart';
import '../home_page.dart';

class ListPesananCaregiverUser extends StatefulWidget {
  const ListPesananCaregiverUser({Key? key}) : super(key: key);
  @override
    State<ListPesananCaregiverUser> createState() => list_pesanan_caregiver_user();
  
}
class list_pesanan_caregiver_user extends State<ListPesananCaregiverUser> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
              .collection("PesananCaregiverUser")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('listPesanan')
              .orderBy('jamMulai', descending: true)
              .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('error');
              } else if (snapshot.hasData || snapshot.data != null) {
                List<DocumentSnapshot> patients = snapshot.data!.docs;
                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 8.0),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot dsData = snapshot.data!.docs[index];
                    String lvChatId = dsData["chatId"];
                    String lvIdCaregiver = dsData["idCaregiver"];
                    Timestamp lvJamMulai= dsData["jamMulai"];
                    final dfJamMulai = DateFormat.Hm().format(lvJamMulai.toDate());
                    Timestamp lvJamSelesai = dsData["jamSelesai"];
                    final dfJamSelesai = DateFormat.Hm().format(lvJamSelesai.toDate());
                    return StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                      .collection("caregiverList")
                      .doc(lvIdCaregiver)
                      .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('error');
                        } else if (snapshot.hasData) {
                          DocumentSnapshot doc = snapshot.data!;
                          String namaCaregiver = doc["nama"];

                          return Card(
                        elevation: 5,
                        child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                              height: 100,
                              width: 250,
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CircleAvatar(
                                        radius: 30, //we give the image a radius of 50
                                        backgroundImage: NetworkImage(
                                            'assets/images/art1.jpg'),
                                      ),
                                      const SizedBox(width: 24), 
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Container(
                                          //   margin: const EdgeInsets.only(top: 8),
                                          //   width: 150,
                                          //   color: Colors.black54,
                                          //   height: 2,
                                          // ),
                                          const SizedBox(height: 4),
                                          
                                          Text(
                                            namaCaregiver,
                                            style: TextStyle(
                                                color: Color.fromRGBO(0, 74, 173, 1),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12
                                                ),
                                          ),
                                          
                                          Text(
                                            DateFormat.yMd().format(lvJamMulai.toDate()),
                                            style: TextStyle(
                                                color: Color.fromRGBO(0, 74, 173, 1),
                                                fontSize: 10
                                                ),
                                          ),

                                          Text(
                                            dfJamMulai + " - " + dfJamSelesai,
                                            style: TextStyle(
                                                color: Color.fromRGBO(0, 74, 173, 1),
                                                fontSize: 10
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                              width: 60,
                                              height: 40,
                                              child: ElevatedButton(
                                                  child: Icon(Icons.message,color: Colors.white),
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Color.fromRGBO(0, 74, 173, 1),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ChatPage(chatId: lvChatId, time: lvJamSelesai,)));
                                                  }))
                                        ],
                                      ),
                                ],  

                            ),
                        )
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
          ));
  }
}
