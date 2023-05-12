import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/home.dart';
import 'package:apps/pictureExchange.dart';

class listTherapyState extends StatelessWidget {
  const listTherapyState({Key? key}) : super(key: key);

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
        child: listTeraphyWidget(),
      ),
    );
  }
}

class listTeraphyWidget extends StatelessWidget {
  const listTeraphyWidget({Key? key}) : super(key: key);

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
                          MaterialPageRoute(builder: (context) => pictureExchange()));
            },
          ),
        ),
        Card(
          elevation: 5,
          child: ListTile(
            title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Storybook Activity',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 74, 173, 1)),
                  ),
                ]),
            onTap: () {},
          ),
        ),
        Card(
          elevation: 5,
          child: ListTile(
            title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Signing Activity',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 74, 173, 1)),
                  ),
                ]),
            onTap: () {},
          ),
        ),
        Card(
          elevation: 5,
          child: ListTile(
            title: Text(
              'Oral Motor Activity',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 74, 173, 1)),
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
