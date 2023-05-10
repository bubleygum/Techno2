import 'dart:math';

import 'package:apps/firebase_options.dart';
import 'package:apps/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart'; // new
import 'package:go_router/go_router.dart';               // new
import 'app_state.dart';                                 // new
import 'package:provider/provider.dart';                 // new
Future<void>  main() async{
  //initialize
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: ((context, child) => const MainApp()),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Material(
        child: Scaffold(
          body: Center(
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}


// end of GoRouter configuration

