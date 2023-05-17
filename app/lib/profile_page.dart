import 'package:apps/DataClass/user_data.dart';
import 'package:apps/dbservices.dart';
import 'package:apps/widget/appbar_widget.dart';
import 'package:apps/widget/profile_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/signUp.dart';
import 'package:apps/login.dart';
import 'package:apps/listTherapy.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfilePage(),
    );
  }
}


class ProfilePage extends StatelessWidget {
  final UserUID = FirebaseAuth.instance.currentUser?.uid;
  String? username = "";
  String? phoneNumber = "";
  var userData = null;
  Future _getUserData() async 
  {
    await FirebaseFirestore.instance.collection('users')
      .doc((FirebaseAuth.instance.currentUser!.uid))
      .get()
      .then((snapshot) async
      {
        if(snapshot.exists)
        {  
          userData = UserData(
            username: snapshot.data()!["username"], 
            phoneNumber: snapshot.data()!["phone-number"],
            email: snapshot.data()!["email"]
            );
          username = snapshot.data()!["username"];
        }

      });
  }
  @override
  Widget build(BuildContext context) {
    _getUserData();
    
    print(username);
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: 'assets/images/art1.jpg', 
            onClicked: () async{}
          ),

        ],
      )
    );
  }

  //Widget buildName(User)

}