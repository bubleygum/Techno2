import 'package:apps/TransaksiUser/ListPesananUser.dart';
import 'package:apps/chatWidget.dart';
import 'package:apps/TransaksiUser/listKonsultasiUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/home.dart';
import 'package:uuid/uuid.dart';

import '../dbservices.dart';
import '../home_page.dart';

enum ConsultType { konsultasiDokter, terapi }
class CaregiverCheckOutPage extends StatefulWidget {
  final String idCaregiver;
  final String nama;
  final String rating;
  final String hargaSesi;
  const CaregiverCheckOutPage({Key? key, required this.nama, required this.rating, required this.hargaSesi, required this.idCaregiver}) : super(key: key);
  @override
    State<CaregiverCheckOutPage> createState() => CaregiverCheckOut();
}

class CaregiverCheckOut extends State<CaregiverCheckOutPage> {
  DateTime _dateController = DateTime.now();
  TimeOfDay _timeController = TimeOfDay.now();
  
  final _lamaSesiController = TextEditingController();
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
    });
    
    }

    // Initial Selected Value
  String dropdownvalue = '1 Jam';   
  
  // List of items in our dropdown menu
  var items = [    
    '1 Jam',
    '2 Jam',
    '3 Jam',
    '4 Jam',
    '5 Jam',
    '6 Jam',
    '7 Jam',
    '8 Jam',
    '9 Jam',
  ];

  var hargaTotal;
  
    

    
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    const SizedBox(height: 4),
                    Row(children: [
                        ElevatedButton(
                          child: Icon(Icons.event,color: Colors.white),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color.fromRGBO(0, 74, 173, 1),
                          ),
                          onPressed:  () async{     
                            final selectedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2025),
                            initialDate: DateTime.now(),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              _dateController = selectedDate;
                              //DateFormat.yMd().format(selectedDate)
                            });
                          }
                          }),
                          const SizedBox(width: 10,),
                          Text(
                          DateFormat.yMd().format(_dateController).toString(),
                          style: TextStyle(
                              color: Color.fromRGBO(0, 74, 173, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(children: [
                        ElevatedButton(
                          child: Icon(Icons.alarm_rounded,color: Colors.white),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color.fromRGBO(0, 74, 173, 1),
                          ),
                          onPressed:  () async{     
                            final selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            builder: (BuildContext context, Widget? child) {
                              return MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(alwaysUse24HourFormat: false),
                                child: child!,
                              );
                            },
                          );

                          if (selectedTime != null) {
                            final text = selectedTime.format(context);
                            setState(() {
                              _timeController = selectedTime;
                            });
                          }
                          }),
                          const SizedBox(width: 10,),
                          Text(
                          _timeController.format(context),
                          style: TextStyle(
                              color: Color.fromRGBO(0, 74, 173, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(children: [
                        Text(
                            "Durasi",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 74, 173, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        const SizedBox(width: 10,),
                        DropdownButton(
                          // Initial Value
                          value: dropdownvalue,
                            
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),  
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(), 
                          onChanged: (String? newValue) { 
                            setState(() {
                              dropdownvalue = newValue!;
                              _lamaSesiController.text = newValue!;
                          });},
                          ),
                          
                          
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
                  "Rp. " +  (int.parse(widget.hargaSesi) * int.parse(dropdownvalue[0])).toString(),
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
                  "Rp. " + (int.parse(widget.hargaSesi) * int.parse(dropdownvalue[0])).toString(),
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
            
            const SizedBox(height: 90), 
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
                                  
                                  createListCustomer(IDChat: idChat, durasi: int.parse(dropdownvalue[0]));
                                  createPesananUser(IDChat: idChat, durasi: int.parse(dropdownvalue[0]));
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
  Future createListCustomer({String? IDChat, int durasi=1}) async{
      final docListCustomer = FirebaseFirestore.instance
      .collection('caregiverList')
      .doc(widget.idCaregiver)
      .collection('listCustomer')
      .doc(FirebaseAuth.instance.currentUser!.uid);
      
        var date = _dateController;
        var time = _timeController;
        var dateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
        final json = {
          'chatId': IDChat,
          'jamMulai': dateTime, 
          'jamSelesai': dateTime.add(Duration(hours: durasi)),
        };
        //create document and write to DB
        await docListCustomer
          .set(json)
          .whenComplete(() => print("added to database"))
          .catchError((e) => print(e));
      
      
  }
  Future createPesananUser({String? IDChat, int durasi=1}) async{
    var idTransaksi = Uuid().v4();
    final docListPesanan = FirebaseFirestore.instance
        .collection('PesananCaregiverUser')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('listPesanan')
        .doc(idTransaksi);
      
      
        var date = _dateController;
        var time = _timeController;
        var dateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
        
        final json = {
        'idCaregiver': widget.idCaregiver,
        'chatId': IDChat,
        'jamMulai': dateTime, 
        'jamSelesai': dateTime.add(Duration(hours: durasi))
      };
      //create document and write to DB
      await docListPesanan
        .set(json)
        .whenComplete(() => print("added to database"))
        .catchError((e) => print(e));
      
    
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
