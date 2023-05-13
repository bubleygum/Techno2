import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/home.dart';

import 'dbservices.dart';

class schoolDetail extends StatelessWidget {
  final String text;
  const schoolDetail({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close, color: Color.fromRGBO(0, 74, 173, 1)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("schoolList")
                .doc(text)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('error');
              } else if (snapshot.hasData && snapshot.data != null) {
                // return Text(text);
                Map<String, dynamic> data = snapshot.data!.data()!;
                String lvNama = data['namaSekolah'];
                // String lvAkreditasi = data['akreditasi'];
                // String lvAlamat = data['alamat'];
                // String lvDetail = data['detail'];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Image.network(
                        'assets/images/1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      lvNama,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 74, 173, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    ),
                    // Text(
                    //   'Akreditasi: $lvAkreditasi',
                    //   style: TextStyle(
                    //     color: Color.fromRGBO(0, 74, 173, 1),
                    //     fontSize: 20
                    //   ),
                    // ),
                    // Text(
                    //   'Alamat: $lvAlamat',
                    //   style: TextStyle(
                    //     color: Color.fromRGBO(0, 74, 173, 1),fontSize: 20
                    //   ),
                    // ),
                    // Text(
                    //   'Detail: $lvDetail',
                    //   style: TextStyle(
                    //     color: Color.fromRGBO(0, 74, 173, 1),fontSize: 20
                    //   ),
                    // ),
                  ],
                );
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
