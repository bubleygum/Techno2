import 'package:apps/schoolDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/home.dart';

import 'ConsultCheckOut.dart';
import 'dbservices.dart';

class TherapistList extends StatelessWidget {
  const TherapistList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: Database.getDataTerapis(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('error');
              } else if (snapshot.hasData || snapshot.data != null) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      DocumentSnapshot dsData = snapshot.data!.docs[index];
                      String lvNama = dsData["nama"];
                      String lvJabatan = dsData["jabatan"];
                      String lvPengalaman = dsData["pengalaman"];
                      String lvRating = dsData["rating"];
                      String lvHargaSesi= dsData["hargaSesi"];
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
                                            lvNama,
                                            style: TextStyle(
                                                color: Color.fromRGBO(0, 74, 173, 1),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            lvJabatan,
                                            style: TextStyle(
                                                color: Color.fromRGBO(0, 74, 173, 1),
                                                fontSize: 10),
                                          ),
                                          Row(crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration:  BoxDecoration (
                                                  color:  Color(0x35004aad),
                                                  borderRadius:  BorderRadius.circular(12),
                                                ),
                                                child: 
                                                RichText(
                                                  text: TextSpan(
                                                    children: <InlineSpan>[
                                                      WidgetSpan(
                                                        alignment: PlaceholderAlignment.middle, 
                                                        child: Icon(Icons.badge, size: 9,),
                                                      ),
                                                      TextSpan(
                                                        text: " " + lvPengalaman + " tahun",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 9),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                                  
                                              ),
                                              const SizedBox(width: 5), 
                                              Container(
                                                decoration:  BoxDecoration (
                                                  color:  Color(0x35004aad),
                                                  borderRadius:  BorderRadius.circular(12),
                                                ),
                                                child: 
                                                  RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      WidgetSpan(
                                                        alignment: PlaceholderAlignment.middle, 
                                                        child: Icon(Icons.thumb_up, size: 9,),
                                                      ),
                                                      TextSpan(
                                                        text: " " + lvRating + "%",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 9),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                                  
                                              )
                                            ],
                                          ),
                                          Text(
                                            "Rp. " + lvHargaSesi,
                                            style: TextStyle(
                                                color: Color.fromRGBO(60, 60, 60, 1),
                                                
                                                ),
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
                                                  child: Text('Jadwalkan'),
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Color.fromRGBO(0, 74, 173, 1),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ConsultCheckOutPage(
                                                                    nama: lvNama,
                                                                    jabatan: lvJabatan,
                                                                    pengalaman: lvPengalaman,
                                                                    hargaSesi: lvHargaSesi,
                                                                    rating: lvRating)));
                                                  }))
                                        ],
                                      ),
                                ],  

                            ),
                        )
                      );
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
