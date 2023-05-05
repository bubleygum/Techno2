import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyCustomForm(),
        ),
      ),
    );
  }
}

//login
// Create a Form widget.  
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
class MyCustomFormState extends State < MyCustomForm > {
  final _formKey = GlobalKey < FormState > ();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: < Widget > [
          // SizedBox(
          //   width: 300,
          //   child: Image.asset('assets/images/art1.jpg')
          //   ),
          SizedBox(
            width: 300,
            height: 30,

            child: TextFormField(
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
                  contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
              ),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: 300,
            height: 30,
            child: TextFormField(
              decoration: const InputDecoration(
                  icon: const Icon(Icons.key),
                    hintText: 'Password',
                    errorStyle: TextStyle(height: 0.5, fontSize: 0),
                    errorMaxLines: 2,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Color.fromRGBO(0, 0, 0, 0.3)),
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
          SizedBox(height: 20),
          //login button
          SizedBox(
            width: 250,
            child: new ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(0, 74, 173, 1),
              ),
              child: const Text('Login'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Loading'))
                    );
                  }
                },
            )),
          SizedBox(height: 10),
          //login as caregiver
          SizedBox(
            width: 250,
            child: new ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(0, 74, 173, 1),
              ),
              child: const Text('Login as Caregiver'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Loading'))
                    );
                  }
                },
            )),
          SizedBox(height: 10),
          //login as counselor / doctor 
          SizedBox(
            width: 250,
            child: new ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(0, 74, 173, 1),
              ),
              child: const Text('Login as Doctor or Counselor'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Loading'))
                    );
                  }
                },
            )),
          SizedBox(height: 10),
          //login as counselor / doctor 
          SizedBox(
            width: 250,
            child: new ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(0, 74, 173, 1),
              ),
              child: const Text('Sign Up'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpForm()));
                },
            )),
        ],
      ),
    );
  }
}

//sign up
// Create a Form widget.  
class SignUpForm extends StatefulWidget {
  @override
  State < SignUpForm > createState() => _SignUpFormState();
}

class _SignUpFormState extends State < SignUpForm > {
  final unameCont = TextEditingController();
  final passCont = TextEditingController();
  final rePassCont = TextEditingController();
  final emailCont = TextEditingController();
  final phoneCont = TextEditingController();
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
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    unameCont.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: < Widget > [
            //username
            SizedBox(
              width: 300,
              height: 30,
              child: TextField(
                controller: unameCont,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                    hintText: 'Username',
                    contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Color.fromRGBO(0, 0, 0, 0.3)),
                    ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              height: 30,
              child: TextFormField(
                controller: passCont,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.key),
                    hintText: 'Password',
                    contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Color.fromRGBO(0, 0, 0, 0.3)),
                    ),

                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              height: 30,
              child: TextFormField(
                controller: rePassCont,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.key),
                    hintText: 'Re-type password',
                    contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Color.fromRGBO(0, 0, 0, 0.3)),
                    ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              height: 30,
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.key),
                  hintText: 'Email password',
                  contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Color.fromRGBO(0, 0, 0, 0.3)),
                    ),
                ),
              ),
            ),
            SizedBox(height: 10),
            //login as counselor / doctor 
            SizedBox(
              width: 250,
              child: new ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(0, 74, 173, 1),
                ),
                child: const Text('Sign Up'),
                  onPressed: () {
                    if (unameCont.text != '' && passCont.text != '' ) {
                      bool result = validatePassword(passCont.text);
                      if (result) {
                        // create account event
                        return null;
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(" Password should contain Capital, small letter & Number & Special"),
                            );
                          },
                        );
                      }
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Loading'))
                      // );
                    } else if (unameCont.text == '') {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("Username Kosong"),
                          );
                        },
                      );
                    } else if (passCont.text == '') {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("Username Kosong"),
                          );
                        },
                      );
                    }
                  },
              )),
          ],
        ),
      ),
    );
  }
}
