import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:apps/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'doctorHome.dart';

class formCaregiver extends StatefulWidget {
  final String namaCaregiver;
  const formCaregiver({Key? key, required this.namaCaregiver}) : super(key: key);

  @override
    State<formCaregiver> createState() => formCaregiverState();
}

class formCaregiverState extends State<formCaregiver> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController pengalaman = TextEditingController();
  TextEditingController jabatan = TextEditingController();
  // show the password or not
  bool _isObscure = true;

  bool validatePhoneNumber(String phone) {
    // Use a regular expression to check if the phone number is valid
    final RegExp phoneRegex = RegExp(r'^[0-9]{10}$');
    return phoneRegex.hasMatch(phone);
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final phoneCont = TextEditingController();
    final passCont = TextEditingController();
    String? username = "";

    // regular expression to check if string
    RegExp pass_valid = RegExp("(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
    //A function that validate user entered password
    bool validatePassword(String pass) {
      String _password = pass.trim();
      if (pass_valid.hasMatch(_password)) {
        return true;
      } else {
        return false;
      }
    }

    var column = 
    Material(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 300,
          height: 30,
          child: TextFormField(
            controller: _usernameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Username harus di isi';
              }
              return null;
            },
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Username',
              errorStyle: TextStyle(height: 0.5, fontSize: 0),
              contentPadding:
                  EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 2, color: Color.fromRGBO(0, 0, 0, 0.3)),
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          width: 300,
          height: 30,
          child: TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.mail),
              hintText: 'Email address',
              errorStyle: TextStyle(height: 0.5, fontSize: 0),
              errorMaxLines: 2,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding:
                  EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 2, color: Color.fromRGBO(0, 0, 0, 0.3)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'email harus di isi';
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          width: 300,
          height: 30,
          child: TextFormField(
            controller: _passwordController,
            obscureText: _isObscure,
            decoration: InputDecoration(
              icon: Icon(Icons.key),
              hintText: 'Password',
              errorStyle: TextStyle(height: 0.5, fontSize: 0),
              errorMaxLines: 2,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding:
                  EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 2, color: Color.fromRGBO(0, 0, 0, 0.3)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password harus di isi';
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          width: 300,
          height: 30,
          child: TextFormField(
            obscureText: _isObscure,
            decoration: const InputDecoration(
              icon: const Icon(Icons.key),
              hintText: 'Re-type Password',
              errorStyle: TextStyle(height: 0.5, fontSize: 0),
              errorMaxLines: 2,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding:
                  EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 2, color: Color.fromRGBO(0, 0, 0, 0.3)),
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value != _passwordController.text.toString()) {
                return 'Password harus di isi';
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          width: 300,
          height: 30,
          child: TextFormField(
            controller: _phoneNumberController,
            decoration: const InputDecoration(
              icon: Icon(FontAwesomeIcons.phone),
              hintText: 'Phone number',
              errorStyle: TextStyle(height: 0.5, fontSize: 0),
              errorMaxLines: 2,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding:
                  EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 2, color: Color.fromRGBO(0, 0, 0, 0.3)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Phone number harus di isi';
              }
              return null;
            },
          ),
        ),
        
        SizedBox(height: 20),
        SizedBox(
            width: 250,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(0, 74, 173, 1),
              ),
              child: const Text('Sign Up'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final UserUID = FirebaseAuth.instance.currentUser?.uid;
                    createUser(userUID: UserUID);

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => DoctorHome()),
                        (Route<dynamic> route) => false);
                  
                }
              },
            )),
        SizedBox(height: 20),
        SizedBox(
            width: 250,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(0, 74, 173, 1),
              ),
              child: const Text('return'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
      ],
    ));
    return Form(
      key: _formKey,
      child: Center(
        child: column,
      ),
    );
  }

  Future<void> createUser({String? userUID}) async {
    final user = FirebaseFirestore.instance.collection("users").doc(userUID!);
    final docDokter =
        FirebaseFirestore.instance.collection('caregiverList').doc(userUID);
    final json = {
      'nama': widget.namaCaregiver,
      'rating': '100',
      'hargaSesi':0,
      'income':0
    };

    //create document and write to DB
    await docDokter
        .set(json)
        .whenComplete(() => print("added to database"))
        .catchError((e) => print(e));
  }
}
