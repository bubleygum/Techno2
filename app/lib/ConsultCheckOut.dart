import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/home.dart';

import 'dbservices.dart';

class ConsultCheckOut extends StatelessWidget {
  final String nama;
  final String jabatan;
  final String pengalaman;
  final String rating;
  final String hargaSesi;
  const ConsultCheckOut(
      {Key? key,
      required this.nama,
      required this.jabatan,
      required this.pengalaman,
      required this.rating,
      required this.hargaSesi})
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
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child:  Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      nama,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 74, 173, 1),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      jabatan,
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
                                  text: " " + pengalaman + " tahun",
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
                                  text: " " + rating + "%",
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
                    

                  ],
                ),
              ],
            ),
            const SizedBox(height: 10), 
            Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: 1920,
                      color: Colors.black54,
                      height: 1,
                    ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Harga Total",
                  style: TextStyle(
                      color: Colors.black,),
                ),
                Text(
                  "Rp. " + hargaSesi,
                  style: TextStyle(
                      color: Colors.black,),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Penyesuaian",
                  style: TextStyle(
                      color: Colors.black,),
                ),
                Text(
                  "Rp. " + "0",
                  style: TextStyle(
                      color: Colors.black,),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bayar",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Rp. " + hargaSesi,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 5), 
            Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: 1920,
                      color: Colors.black54,
                      height: 1,
            ),
            const SizedBox(height: 5), 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pilih Metode Pembayaran",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 74, 173, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 5), 
            Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: 1920,
                      color: Color.fromRGBO(0, 74, 173, 1),
                      height: 1,
            ),
            const SizedBox(height: 5), 

            Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                            child: Text('Bayar'),
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
  )
    );
  }
}
