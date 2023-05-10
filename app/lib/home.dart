import 'package:flutter/material.dart';
import 'package:apps/home_page.dart';
import 'package:apps/theraphy.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Sign Up')),
      body: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.handHoldingHeart),
                    iconSize: 30,
                    color: Color.fromRGBO(0, 74, 173, 1),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Therapy()));
                    },
                  ),
                  Text(
                    'Therapy',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Color.fromRGBO(0, 74, 173, 1),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.school),
                    iconSize: 30,
                    color: Color.fromRGBO(0, 74, 173, 1),
                    onPressed: () {},
                  ),
                  Text(
                    'School',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Color.fromRGBO(0, 74, 173, 1),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.userPlus),
                    iconSize: 30,
                    color: Color.fromRGBO(0, 74, 173, 1),
                    onPressed: () {},
                  ),
                  Text(
                    'Training',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Color.fromRGBO(0, 74, 173, 1),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.userDoctor),
                    iconSize: 30,
                    color: Color.fromRGBO(0, 74, 173, 1),
                    onPressed: () {},
                  ),
                  Text(
                    'Consultation',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Color.fromRGBO(0, 74, 173, 1),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.userNurse),
                    iconSize: 30,
                    color: Color.fromRGBO(0, 74, 173, 1),
                    onPressed: () {},
                  ),
                  Text(
                    'Caregiver',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Color.fromRGBO(0, 74, 173, 1),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.message),
                    iconSize: 30,
                    color: Color.fromRGBO(0, 74, 173, 1),
                    onPressed: () {},
                  ),
                  Text(
                    'Forum',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Color.fromRGBO(0, 74, 173, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text('Back To School Program'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('New Enrollment Discount'),
                      SizedBox(
                        width: 100,
                          child: ElevatedButton(
                              child: Text('Details'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(0, 74, 173, 1),
                              ),
                              onPressed: () {}))
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('What is Training?'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        width: 100,
                          child: ElevatedButton(
                              child: Text('Tutorial'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(0, 74, 173, 1),
                              ),
                              onPressed: () {}))
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('What is Consultation?'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        width: 100,
                          child: ElevatedButton(
                              child: Text('Tutorial'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(0, 74, 173, 1),
                              ),
                              onPressed: () {}))
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('What is Caregiver?'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        width: 100,
                          child: ElevatedButton(
                              child: Text('Tutorial'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(0, 74, 173, 1),
                              ),
                              onPressed: () {}))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
