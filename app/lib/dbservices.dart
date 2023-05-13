import 'package:cloud_firestore/cloud_firestore.dart';

import 'DataClass/school_data.dart';

CollectionReference tabelSekolah = FirebaseFirestore.instance.collection("schoolList");
class Database{
  //read data list sekolah 
  static Stream<QuerySnapshot> getData(){
    return tabelSekolah.snapshots();
  }
  //input data list sekolah 
  static Future<void> tambahData({required schoolList item})async{
    DocumentReference docRef = tabelSekolah.doc(item.namaSekolah);
    await docRef
    .set(item.toJson())
    .whenComplete(() => print("data diinput"))
    .catchError((e)=> print(e));
    
  }

}

