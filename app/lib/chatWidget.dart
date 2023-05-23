import 'package:flutter/material.dart';
import 'package:apps/home.dart';

class chat extends StatelessWidget {
  const chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Color.fromRGBO(0, 74, 173, 1)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Chat',
          style: TextStyle(color: Color.fromRGBO(0, 74, 173, 1)),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: chatWidget(),
      ),
    );
  }
}

class chatWidget extends StatelessWidget {
  const chatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  }
}