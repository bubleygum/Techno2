import 'package:cloud_firestore/cloud_firestore.dart';

import 'DataClass/school_data.dart';
import 'DataClass/workshop_data.dart';

CollectionReference tabelSekolah = FirebaseFirestore.instance.collection("schoolList");
CollectionReference tabelPelatihan = FirebaseFirestore.instance.collection("workshopList");
class Database{
  //read data list sekolah 
  static Stream<QuerySnapshot> getDataSekolah(){
    return tabelSekolah.snapshots();
  }
  //input data list sekolah 
  static Future<void> tambahDataSekolah({required schoolList item})async{
    DocumentReference docRef = tabelSekolah.doc(item.namaSekolah);
    await docRef
    .set(item.toJson())
    .whenComplete(() => print("data diinput"))
    .catchError((e)=> print(e));
    
  }
  //read data list workshop 
  static Stream<QuerySnapshot> getDataPelatihan(){
    return tabelPelatihan.snapshots();
  }
    //input data list workshop 
  static Future<void> tambahDataPelatihan({required workshopList item})async{
    DocumentReference docRef = tabelPelatihan.doc(item.namaPelatihan);
    await docRef
    .set(item.toJson())
    .whenComplete(() => print("data diinput"))
    .catchError((e)=> print(e));
    
  }
}

