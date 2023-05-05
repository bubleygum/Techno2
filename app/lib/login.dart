import 'package:flutter/material.dart';
import 'package:apps/signUp.dart';
import 'package:apps/home_page.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({ Key ? key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey < FormState > ();

    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: < Widget > [
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
                    contentPadding: EdgeInsets.only(
                      left: 10, top: 10, bottom: 10, right: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2, color: Color.fromRGBO(0, 0, 0, 0.3)),
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => home_page()));
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MySignUpPage()));
                  },
              )),
          ],
        ),
      ),
    );
  }
}