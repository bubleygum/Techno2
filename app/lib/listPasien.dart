import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/home.dart';
import 'package:apps/pictureExchange.dart';

class listPasien extends StatelessWidget {
  const listPasien({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Color.fromRGBO(0, 74, 173, 1)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Therapy List',
          style: TextStyle(color: Color.fromRGBO(0, 74, 173, 1)),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: listPasienWidget(),
      ),
    );
  }
}

class listPasienWidget extends StatelessWidget {
  const listPasienWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          elevation: 5,
          child: ListTile(
            title: Text(
              'Picture Exchange Activity',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 74, 173, 1)),
            ),
            onTap: () {
              Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PictureExchange()));
            },
          ),
        ),
        
      ],
    );
  }
}
