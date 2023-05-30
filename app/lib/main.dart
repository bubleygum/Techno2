import 'package:apps/firebase_options.dart';
import 'package:apps/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';            
import 'app_state.dart';                                 
import 'package:provider/provider.dart';                 
Future<void>  main() async{
  //initialize
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: ((context, child) => const MainApp()),
    // builder: ((context, child) => const home_page()),
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



