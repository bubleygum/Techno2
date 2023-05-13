import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/home.dart';

import 'dbservices.dart';

class schoolDetail extends StatelessWidget {
  final String nama;
  final String alamat;
  final String akreditasi;
  final String noTelp;
  final String detail;
  const schoolDetail(
      {Key? key,
      required this.nama,
      required this.alamat,
      required this.akreditasi,
      required this.noTelp,
      required this.detail})
      : super(key: key);

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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Image.network(
                'assets/images/1.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                nama,
                style: TextStyle(
                  color: Color.fromRGBO(0, 74, 173, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'Akreditasi: $akreditasi',
                style: TextStyle(
                    color: Color.fromRGBO(0, 74, 173, 1), fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'Alamat: $alamat',
                style: TextStyle(
                    color: Color.fromRGBO(0, 74, 173, 1), fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'Nomor Telepon: $noTelp',
                style: TextStyle(
                    color: Color.fromRGBO(0, 74, 173, 1), fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'Detail: $detail',
                style: TextStyle(
                    color: Color.fromRGBO(0, 74, 173, 1), fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
