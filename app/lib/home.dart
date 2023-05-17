import 'package:apps/workshopList_widget.dart';
import 'package:flutter/material.dart';
import 'package:apps/home_page.dart';
import 'package:apps/schoolList_widget.dart';
import 'package:apps/listTherapy.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:apps/doctor_therapist.dart';

final List<String> imgList = [
  'assets/images/2.png',
  'assets/images/5.png',
  'assets/images/3.png',
  'assets/images/4.png',
  'assets/images/1.png',
];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => listTherapyState()));
                    },
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Theraphy',
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
                    icon: FaIcon(FontAwesomeIcons.school),
                    iconSize: 30,
                    color: Color.fromRGBO(0, 74, 173, 1),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => schoolList()));
                    },
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'School',
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
                    icon: FaIcon(FontAwesomeIcons.userPlus),
                    iconSize: 30,
                    color: Color.fromRGBO(0, 74, 173, 1),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => workshopList()));
                    },
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Training',
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
                    icon: FaIcon(FontAwesomeIcons.userDoctor),
                    iconSize: 30,
                    color: Color.fromRGBO(0, 74, 173, 1),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => doctor_therapist()));
                    },
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Consultation',
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
                    icon: FaIcon(FontAwesomeIcons.userNurse),
                    iconSize: 30,
                    color: Color.fromRGBO(0, 74, 173, 1),
                    onPressed: () {},
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Caregiver',
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
                    icon: FaIcon(FontAwesomeIcons.message),
                    iconSize: 30,
                    color: Color.fromRGBO(0, 74, 173, 1),
                    onPressed: () {},
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Forum',
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
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Container(
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                            child: CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 2.0,
                          ),
                          items: imageSliders,
                        )),
                      ),
                    ),
                  ]),
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
                  title: Text(
                    'Back To School Program',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 74, 173, 1)),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'New Enrollment Discount',
                        style: TextStyle(color: Color.fromRGBO(0, 74, 173, 1)),
                      ),
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
                elevation: 5,
                child: ListTile(
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'What is Training?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 74, 173, 1)),
                        ),
                        Text(
                          'Training is a place where kids or adults with down syndrome can learn new things and gain new skills.\nClick the tutorial button to learn how to use it!',
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

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Color.fromARGB(200, 0, 0, 0),
                            //     Color.fromARGB(0, 0, 0, 0)
                            //   ],
                            //   begin: Alignment.bottomCenter,
                            //   end: Alignment.topCenter,
                            // ),
                            ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        // child: Text(
                        //   'No. ${imgList.indexOf(item)} image',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 20.0,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
