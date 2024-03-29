import 'package:apps/workshopDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/home.dart';

import 'dbservices.dart';

class workshopList extends StatelessWidget {
  const workshopList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close, color: Color.fromRGBO(0, 74, 173, 1)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Workshop Recommendation',
            style: TextStyle(color: Color.fromRGBO(0, 74, 173, 1)),
          ),
          backgroundColor: Colors.white,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: Database.getDataPelatihan(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('error');
              } else if (snapshot.hasData || snapshot.data != null) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      DocumentSnapshot dsData = snapshot.data!.docs[index];
                      String lvNama = dsData["namaPelatihan"];
                      String lvTipe = dsData["type"];
                      String lvKontak = dsData["kontak"];
                      String lvDetail = dsData["detail"];
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Flexible(
                            child: Image.network(
                              'assets/images/1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            lvNama,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 74, 173, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Tipe Pelatihan: $lvTipe',
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 74, 173, 1),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  SizedBox(
                                      width: 100,
                                      child: ElevatedButton(
                                          child: Text('Details'),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Color.fromRGBO(0, 74, 173, 1),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        workshopDetail(
                                                            nama: lvNama,
                                                            kontak: lvKontak,
                                                            tipe: lvTipe,
                                                            detail: lvDetail,)));
                                          }))
                                ],
                              ),
                            ],
                          ),
                        ),
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
