import 'package:flutter/material.dart';
import 'package:apps/home_page.dart';
import 'package:apps/theraphy.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/images/art1.jpg',
  'assets/images/img1.jpg',
  'assets/images/img2.jpg',
  'assets/images/img3.jpg',
  'assets/images/img4.jpg',
  'assets/images/img5.jpg',
];

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
        SizedBox(
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
        Expanded(
          child: ListView(
            children: <Widget>[
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
                  title: Text(
                    'What is Training?',
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
              Card(
                elevation: 5,
                child: ListTile(
                  title: Text(
                    'What is Consultation?',
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
