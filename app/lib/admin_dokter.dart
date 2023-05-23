import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class adminDokter extends StatelessWidget {
  const adminDokter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: adminDokterScreen(),
    );
  }
}

class adminDokterScreen extends StatelessWidget {
  const adminDokterScreen({Key? key}) : super(key: key);

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
                      icon: FaIcon(FontAwesomeIcons.calendarCheck),
                      iconSize: 30,
                      color: Color.fromRGBO(0, 74, 173, 1),
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => ListTherapy()));
                      },
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Appointments',
                        style: TextStyle(
                            fontSize: 10, color: Color.fromRGBO(0, 74, 173, 1)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.calendarCheck),
                      iconSize: 30,
                      color: Color.fromRGBO(0, 74, 173, 1),
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => ListTherapy()));
                      },
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Patients',
                        style: TextStyle(
                            fontSize: 10, color: Color.fromRGBO(0, 74, 173, 1)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.calendarCheck),
                      iconSize: 30,
                      color: Color.fromRGBO(0, 74, 173, 1),
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => ListTherapy()));
                      },
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Documents',
                        style: TextStyle(
                            fontSize: 10, color: Color.fromRGBO(0, 74, 173, 1)),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ],
    );
  }
}
