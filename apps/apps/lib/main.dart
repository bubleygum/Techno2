import 'package:flutter/material.dart';

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
// Create a corresponding State class. This class holds data related to the form.  
class MyCustomFormState extends State < MyCustomForm > {
  // Create a global key that uniquely identifies the Form widget  
  // and allows validation of the form.  
  final _formKey = GlobalKey < FormState > ();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.  
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: < Widget > [
          SizedBox(
            width: 300,
            child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')
            ),
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
                  labelText: 'Username',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: OutlineInputBorder(
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password harus di isi';
                }
                return null;
              },
              decoration: const InputDecoration(
                icon: const Icon(Icons.key),
                  hintText: 'Password',
                  labelText: 'Password',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
              ),
            ),
          ),
          SizedBox(height: 20),
          //login button
          SizedBox(
            width: 250,
            child: new ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(0, 74, 173,1),
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
                primary: Color.fromRGBO(0, 74, 173,1),
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
                primary: Color.fromRGBO(0, 74, 173,1),
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
                primary: Color.fromRGBO(0, 74, 173,1),
              ),
              child: const Text('Sign Up'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Loading'))
                    );
                  }
                },
            )),
        ],
      ),
    );
  }
}