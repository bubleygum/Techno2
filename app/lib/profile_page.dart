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

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);
  @override
    State<MyProfilePage> createState() => ProfilePage();
  
}


class ProfilePage extends State<MyProfilePage> {
  final UserUID = FirebaseAuth.instance.currentUser?.uid;
  String? username = "";
  String? phoneNumber = "";
  var userData = UserData(username: '', phoneNumber: '', email: '');
  bool _isLoading = true;
  Future _getUserData() async 
  {
    await FirebaseFirestore.instance.collection('users')
      .doc((FirebaseAuth.instance.currentUser!.uid))
      .get()
      .then((snapshot) async
      {
        if(snapshot.exists)
        {  
          setState(() {
            userData = UserData(
            username: snapshot.data()!["username"], 
            phoneNumber: snapshot.data()!["phone-number"],
            email: snapshot.data()!["email"]
            );
            _isLoading = false;
          });
          
        }

      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: _isLoading
        ? Center(child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
                    Color.fromRGBO(0, 74, 173, 1),
                  ),) 
        )
        : ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: 'assets/images/art1.jpg', 
            onClicked: () async{}
          ),
          const SizedBox(height: 24),
          buildName(userData),
          const SizedBox(height: 24),
          Center(child: buildButton()),

        ],
      )
      
    );
  }

  Widget buildName(UserData _userData) => Column(
        children: [
          Text(
            _userData.username,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            _userData.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
  );

  Widget buildButton() => ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Color.fromRGBO(0, 74, 173, 1),
    ),
        child: const Text('Settings'),
          onPressed: () {

          },
      );

}