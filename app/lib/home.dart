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
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
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
        Expanded(
          child: Container(
              child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          )),
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

class ImageSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image slider demo')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(),
        items: imgList
            .map((item) => Container(
                  child: Center(
                      child:
                          Image.network(item, fit: BoxFit.cover, width: 1000)),
                ))
            .toList(),
      )),
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
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
