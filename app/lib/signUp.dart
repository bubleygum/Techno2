import 'package:flutter/material.dart';
import 'package:apps/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MySignUpPage extends StatelessWidget {
  const MySignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Sign Up')),
      body: SignUpForm(),
    );
  }
}

class SignUpForm extends StatelessWidget {
  //SignUpForm({super.key});
  TextEditingController _emailController  = TextEditingController();
  TextEditingController _passwordController  = TextEditingController();
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

    var column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
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
            controller: phoneCont,
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
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
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 30,
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.lock),
                  hintText: 'OTP',
                  errorStyle: TextStyle(height: 0.5, fontSize: 0),
                  errorMaxLines: 2,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding:
                      EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'OTP harus di isi';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(width: 10),
            SizedBox(
                width: 140,
                child: new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(0, 74, 173, 1),
                  ),
                  child: const Text('Send OTP'),
                  onPressed: () {
                    if (validatePhoneNumber(phoneCont.text)) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(content: Text('OTP Send')));
                    } else {
                      // Show an error message if the phone number is not valid
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //         content: Text('Invalid phone number')));
                    }
                  },
                )),
          ],
        ),
        SizedBox(height: 20),
        SizedBox(
            width: 250,
            child: new ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(0, 74, 173, 1),
              ),
              child: const Text('Sign Up'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _emailController.text, 
                    password: _passwordController.text).then((value){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyLogInPage()));
                    }).onError((error, stackTrace) {
                      print("error ${error.toString()}");
                    });
                }
                
                      
              },
            )),
      ],
    );
    return Form(
      key: _formKey,
      child: Center(
        child: column,
      ),
    );
  }
}
