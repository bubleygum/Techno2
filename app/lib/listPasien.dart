import 'package:apps/CheckOut/ConsultCheckOut.dart';
import 'package:apps/schoolDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/home.dart';
import 'dbservices.dart';

class listPasien extends StatelessWidget {
  const listPasien({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: Database.getDataDokter(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('error');
              } else if (snapshot.hasData || snapshot.data != null) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      DocumentSnapshot dsData = snapshot.data!.docs[index];
                      String lvNama = dsData["nama"];
                      String lvUsia = dsData["usia"];
                      String lvBeratBadan = dsData["beratBadan"];
                      String lvTinggiBadan = dsData["tinggiBadan"];
                      String lvJam = dsData["jam"];
                      String lvJenis = dsData["jenis"];
                      return Card(
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            height: 100,
                            width: 250,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CircleAvatar(
                                      radius: 30, 
                                      backgroundImage: NetworkImage(
                                          'assets/images/art1.jpg'),
                                    ),
                                    const SizedBox(width: 24),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 4),
                                        Text(
                                          lvNama,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 74, 173, 1),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Usia: $lvUsia",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 74, 173, 1),
                                              fontSize: 10),
                                        ),
                                        Text(
                                          "Berat Badan: $lvBeratBadan",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 74, 173, 1),
                                              fontSize: 10),
                                        ),
                                        Text(
                                          "Tinggi Badan: $lvTinggiBadan",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 74, 173, 1),
                                              fontSize: 10),
                                        ),
                                        Text(
                                          "Jam Sesi: $lvJam",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 74, 173, 1),
                                              fontSize: 10),
                                        ),
                                        Text(
                                          "Jenis Konsultasi: $lvJenis",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 74, 173, 1),
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    SizedBox(
                                        width: 100,
                                        height: 40,
                                        child: ElevatedButton(
                                            child: Text('Chat'),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color.fromRGBO(0, 74, 173, 1),
                                            ),
                                            onPressed: () {
                                              
                                            }))
                                  ],
                                ),
                              ],
                            ),
                          ));
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 8.0),
                    itemCount: snapshot.data!.docs.length);
              }
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Color.fromRGBO(0, 74, 173, 1),
                  ),
                ),
              );
            }));
  }
}
