import 'package:apps/TransaksiUser/ListPesananUser.dart';
import 'package:apps/chatWidget.dart';
import 'package:apps/TransaksiUser/listKonsultasiUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/home.dart';
import 'package:uuid/uuid.dart';

import '../dbservices.dart';
import '../home_page.dart';

enum ConsultType { konsultasiDokter, terapi }
class ConsultCheckOutPage extends StatefulWidget {
  final String idDokter;
  final String nama;
  final String jabatan;
  final String pengalaman;
  final String rating;
  final String hargaSesi;
  final int income;
  final ConsultType jenisKonsultasi;
  const ConsultCheckOutPage({Key? key, required this.nama, required this.jabatan, required this.pengalaman, required this.rating, required this.hargaSesi, required this.idDokter, required this.jenisKonsultasi, required this.income}) : super(key: key);
  @override
    State<ConsultCheckOutPage> createState() => ConsultCheckOut();
}
class ConsultCheckOut extends State<ConsultCheckOutPage> {

  @override
  Widget build(BuildContext context) {
    DateTime _dateTime = DateTime.now();
    void _showDatePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2023), 
      lastDate: DateTime(2025)
      ).then((value){
        setState(() {
          _dateTime = value!;
        });
    });;
    }
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
                      widget.nama,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 74, 173, 1),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.jabatan,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 74, 173, 1),
                          fontSize: 10),
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
                  "Rp. " + widget.hargaSesi,
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
                  "Rp. " + widget.hargaSesi,
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
            Row(
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
            Card(
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                height: 130,
                width: 1080,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Uang Elektronik",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 74, 173, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    const SizedBox(height: 2), 
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: 1920, 
                      color: Color.fromRGBO(0, 74, 173, 1),
                      height: 1,
                    ),                  
                    const SizedBox(height: 8), 
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                      children: [
                        Text(
                          "GOPAY",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        Text(
                          "Saldo: Rp. 130.000",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2), 
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: 1920, 
                      color: Color.fromRGBO(0, 74, 173, 1),
                      height: 1,
                    ),
                    const SizedBox(height: 8), 
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                      children: [
                        Text(
                          "DANA",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        Text(
                          "Saldo: Rp. 150.000",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2), 
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: 1920, 
                      color: Color.fromRGBO(0, 74, 173, 1),
                      height: 1,
                    ),
                    const SizedBox(height: 8), 
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                      children: [
                        Text(
                          "Link aja",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        Text(
                          "Saldo: Rp. 75.000",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 150), 
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: 1920, 
              color: Color.fromRGBO(0, 74, 173, 1),
              height: 1,
            ),
            const SizedBox(height: 5), 
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pembayaranmu",
                          style: TextStyle(
                              color: Color.fromRGBO(0, 74, 173, 1),
                              ),
                        ),
                        Text(
                          "Rp. " + widget.hargaSesi,
                          style: TextStyle(
                              color: Colors.black,),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                            width: 75,
                            height: 25,
                            child: ElevatedButton(
                                child: Text('Bayar'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(0, 74, 173, 1),
                                ),
                                onPressed: () {     
                                  var idChat = Uuid().v4();
                                  var total = int.parse(widget.hargaSesi) + widget.income;
                                  UpdateIncomeDokter(total);
                                  createListPasien(IDChat: idChat);
                                  createPesananUser(IDChat: idChat);
                                  createChat(IDChat: idChat);
                                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ListPesananUser()), (Route<dynamic> route) => false);
                                })),
                      ],
                    )
                  ],
                ),
          ],  

      ),
  )
    );
  }
  Future createListPasien({String? IDChat}) async{
    if(widget.jenisKonsultasi == ConsultType.konsultasiDokter){
      final docListPasien = FirebaseFirestore.instance
      .collection('doctorList')
      .doc(widget.idDokter)
      .collection('listPasien')
      .doc(FirebaseAuth.instance.currentUser!.uid);
      final json = {
        'chatId': IDChat,
        'jamMulai': DateTime.now(), 
        'jamSelesai': DateTime.now().add(Duration(hours: 1)),
      };
      //create document and write to DB
      await docListPasien
        .set(json)
        .whenComplete(() => print("added to database"))
        .catchError((e) => print(e));
    }else if(widget.jenisKonsultasi == ConsultType.terapi){
      final docListPasien = FirebaseFirestore.instance
      .collection('therapistList')
      .doc(widget.idDokter)
      .collection('listPasien')
      .doc(FirebaseAuth.instance.currentUser!.uid);
      final json = {
        'chatId': IDChat,
        'jamMulai': DateTime.now(), 
        'jamSelesai': DateTime.now().add(Duration(hours: 1)),
      };
      //create document and write to DB
      await docListPasien
        .set(json)
        .whenComplete(() => print("added to database"))
        .catchError((e) => print(e));
    }
    
  }
  Future UpdateIncomeDokter(int incomeDokter) async{
    if(widget.jenisKonsultasi == ConsultType.konsultasiDokter){
      final docListPasien = FirebaseFirestore.instance
      .collection('doctorList')
      .doc(widget.idDokter)
      .update({"income": incomeDokter})
      .then((_) => print('Field updated successfully!'))
      .catchError((error) => print('Error updating field: $error'));
      
    }else if(widget.jenisKonsultasi == ConsultType.terapi){
      final docListPasien = FirebaseFirestore.instance
      .collection('therapistList')
      .doc(widget.idDokter)
      .update({"income": incomeDokter})
      .then((_) => print('Field updated successfully!'))
      .catchError((error) => print('Error updating field: $error'));
    }
    
  }
  Future createPesananUser({String? IDChat}) async{
    var idTransaksi = Uuid().v4();
    final docListKonsultasi = FirebaseFirestore.instance
        .collection('KonsultasiUser')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('listKonsultasi')
        .doc(idTransaksi);
    if(widget.jenisKonsultasi == ConsultType.konsultasiDokter){
      final json = {
        'idDokter': widget.idDokter,
        'chatId': IDChat,
        'jamMulai': DateTime.now(), 
        'jamSelesai': DateTime.now().add(Duration(hours: 1)),
        'jenisKonsultasi': 'Konsultasi Dokter'
      };
      //create document and write to DB
      await docListKonsultasi
        .set(json)
        .whenComplete(() => print("added to database"))
        .catchError((e) => print(e));
    }else if(widget.jenisKonsultasi == ConsultType.terapi){
      final json = {
        'idDokter': widget.idDokter,
        'chatId': IDChat,
        'jamMulai': DateTime.now(), 
        'jamSelesai': DateTime.now().add(Duration(hours: 1)),
        'jenisKonsultasi': 'Terapi'
      };
      //create document and write to DB
      await docListKonsultasi
        .set(json)
        .whenComplete(() => print("added to database"))
        .catchError((e) => print(e));
    }
    
    
  }

  
  Future createChat({String? IDChat}) async{
    var idTransaksi = Uuid().v4();
    final docListPasien = FirebaseFirestore.instance
      .collection('chat')
      .doc(IDChat)
      .collection('messages');
    
    //create collection and write to DB
    await docListPasien
      .add({})
      .catchError((e) => print(e));;
  }

}
