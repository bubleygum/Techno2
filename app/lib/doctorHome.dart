import 'package:apps/doctorList.dart';
import 'package:apps/workshopList_widget.dart';
import 'package:flutter/material.dart';
import 'package:apps/home_page.dart';
import 'package:apps/schoolList_widget.dart';
import 'package:apps/listTherapy.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:apps/doctor_therapist.dart';
import 'package:apps/chatWidget.dart';
import 'caregiver_list.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoctorHomeScreen(),
    );
  }
}

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({Key? key}) : super(key: key);

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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChatPage(chatId:"id",)));
                    },
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Patient',
                      style: TextStyle(
                          fontSize: 10, color: Color.fromRGBO(0, 74, 173, 1)),
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
              SizedBox(height: 20),
              FittedBox(
                alignment: Alignment.topLeft,
                fit: BoxFit.scaleDown,
                child: Text(
                  'Tutorials',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 74, 173, 1)),
                ),
              ),
              SizedBox(height: 10),
              Card(
                elevation: 5,
                child: ListTile(
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Register as Doctor Here',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 74, 173, 1)),
                        ),
                        Text(
                          'Complete the form and upload the required documents to start!',
                          style:
                              TextStyle(color: Color.fromRGBO(0, 74, 173, 1)),
                        ),
                      ]),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                          width: 100,
                          child: ElevatedButton(
                              child: Text('Register'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(0, 74, 173, 1),
                              ),
                              onPressed: () {}))
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'What is Consultation?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 74, 173, 1)),
                        ),
                        Text(
                          'Consultation is a place where you can find the best doctor to consult with! \nClick the tutorial button to learn how to use it!',
                          style:
                              TextStyle(color: Color.fromRGBO(0, 74, 173, 1)),
                        ),
                      ]),
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
                elevation: 5,
                child: ListTile(
                  title: Text(
                    'What is Caregiver?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 74, 173, 1)),
                  ),
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

