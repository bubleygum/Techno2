import 'package:apps/CheckOut/CareGiverCheckOut.dart';
import 'package:apps/schoolDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/home.dart';

import 'dbservices.dart';

class caregiver_list extends StatelessWidget {
  const caregiver_list({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close, color: Color.fromRGBO(0, 74, 173, 1)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Caregiver',
            style: TextStyle(color: Color.fromRGBO(0, 74, 173, 1)),
          ),
          backgroundColor: Colors.white,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: Database.getDataCaregiver(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('error');
              } else if (snapshot.hasData || snapshot.data != null) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      DocumentSnapshot dsData = snapshot.data!.docs[index];
                      String lvIdCaregiver = dsData.id;
                      String lvNama = dsData["nama"];
                      String lvRating = dsData["rating"];
                      String lvHargaSesi= dsData["hargaSesi"].toString();
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
                                            "Biaya / Jam Rp. " + lvHargaSesi,
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
                                                                CaregiverCheckOutPage(
                                                                  nama: lvNama, 
                                                                  rating: lvRating, 
                                                                  hargaSesi: lvHargaSesi, 
                                                                  idCaregiver: lvIdCaregiver)));
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
