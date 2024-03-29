import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:apps/signUp.dart';
import 'package:apps/home_page.dart';


class MyLogInPage extends StatelessWidget {
  const MyLogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Sign Up')),
      body: LoginForm(),
    );
  }
}
class LoginForm extends StatelessWidget {
  //const LoginForm({ Key ? key});
  TextEditingController _emailController  = TextEditingController();
  TextEditingController _passwordController  = TextEditingController();
    // show the password or not
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey < FormState > ();

    return Form(
      key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: < Widget > [
            SizedBox(height: 75),
            Image.asset('assets/images/logo_guide.png',
              width: 200, 
              height: 200,),
            SizedBox(height: 70),
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
                controller: _emailController,
                decoration: const InputDecoration(
                  
                  icon: const Icon(Icons.person),
                    hintText: 'Username/Email',
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
                controller: _passwordController,
                obscureText: _isObscure,
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
              width: 275,
              child: new ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(0, 74, 173, 1),
                ),
                child: const Text('Login'),
                  onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Loading'))
                      );
                    if (_formKey.currentState!.validate()) {
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailController.text, 
                        password: _passwordController.text).then((value) {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => home_page()), (Route<dynamic> route) => false);
                        }).onError((error, stackTrace) {
                          ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('The password is invalid'))
                      );
                        });
                    }
                  },
              )),
            // SizedBox(height: 10),
            // //login as caregiver
            // SizedBox(
            //   width: 250,
            //   child: new ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       primary: Color.fromRGBO(0, 74, 173, 1),
            //     ),
            //     child: const Text('Login as Caregiver'),
            //       onPressed: () {
            //         if (_formKey.currentState!.validate()) {
            //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => home_page()));
            //         }
            //       },
            //   )),
            // SizedBox(height: 10),
            // //login as counselor / doctor 
            // SizedBox(
            //   width: 250,
            //   child: new ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       primary: Color.fromRGBO(0, 74, 173, 1),
            //     ),
            //     child: const Text('Login as Doctor or Counselor'),
            //       onPressed: () {
            //         if (_formKey.currentState!.validate()) {
            //           ScaffoldMessenger.of(context).showSnackBar(
            //             const SnackBar(content: Text('Loading'))
            //           );
            //         }
            //       },
            //   )),
            SizedBox(height: 10),
            //login as counselor / doctor  
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't Have Account?",
                  style: TextStyle(color: Color.fromRGBO(30, 100, 192, 1))),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MySignUpPage()), (Route<dynamic> route) => false);
                  },
                  child: const Text(" Sign Up",
                  style: TextStyle(color: Color.fromRGBO(0, 74, 173, 1), fontWeight: FontWeight.bold)),
                )

              ],

            )
          ],
        ),
    );
  }
}