import 'package:cloud_firestore/cloud_firestore.dart';

import 'DataClass/school_data.dart';
import 'DataClass/workshop_data.dart';

CollectionReference tabelSekolah =
    FirebaseFirestore.instance.collection("schoolList");
CollectionReference tabelPelatihan =
    FirebaseFirestore.instance.collection("workshopList");
CollectionReference tabelDokter =
    FirebaseFirestore.instance.collection("doctorList");
CollectionReference tabelTerapis =
    FirebaseFirestore.instance.collection("therapistList");

CollectionReference tabelCaregiver =
    FirebaseFirestore.instance.collection("caregiverList");

class Database {
  //read data list sekolah
  static Stream<QuerySnapshot> getDataSekolah() {
    return tabelSekolah.snapshots();
  }

  //input data list sekolah
  static Future<void> tambahDataSekolah({required schoolList item}) async {
    DocumentReference docRef = tabelSekolah.doc(item.namaSekolah);
    await docRef
        .set(item.toJson())
        .whenComplete(() => print("data diinput"))
        .catchError((e) => print(e));
  }

  //read data list workshop
  static Stream<QuerySnapshot> getDataPelatihan() {
    return tabelPelatihan.snapshots();
  }

  //input data list workshop
  static Future<void> tambahDataPelatihan({required workshopList item}) async {
    DocumentReference docRef = tabelPelatihan.doc(item.namaPelatihan);
    await docRef
        .set(item.toJson())
        .whenComplete(() => print("data diinput"))
        .catchError((e) => print(e));
  }

  //read data list dokter
  static Stream<QuerySnapshot> getDataDokter() {
    return tabelDokter.snapshots();
  }

  //read data list terapis
  static Stream<QuerySnapshot> getDataTerapis() {
    return tabelTerapis.snapshots();
  }

  //read data list caregiver
  static Stream<QuerySnapshot> getDataCaregiver() {
    return tabelCaregiver.snapshots();
  }

  //read data list pasien
  static Stream<QuerySnapshot> getListPasien(id) {
    DocumentReference docRef = tabelDokter.doc(id);
    CollectionReference listPatient = docRef.collection("listPasien");
    return listPatient.snapshots();
  }
  static Stream<QuerySnapshot> getListPasienCare(id) {
    DocumentReference docRef = tabelCaregiver.doc(id);
    CollectionReference listPatient = docRef.collection("listPasien");
    return listPatient.snapshots();
  }
  static Stream<DocumentSnapshot> getPatientData(String? patientID) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(patientID)
        .snapshots();
  }
  static Stream<DocumentSnapshot> getDoctorDetail(String? doctorID) {
    return FirebaseFirestore.instance
        .collection('doctorList')
        .doc(doctorID)
        .snapshots();
  }
}
