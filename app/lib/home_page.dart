import 'package:apps/TransaksiUser/ListPesananUser.dart';
import 'package:apps/home.dart';
import 'package:apps/TransaksiUser/listKonsultasiUser.dart';
import 'package:apps/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/signUp.dart';
import 'package:apps/login.dart';
import 'package:apps/listTherapy.dart';

import 'caregiver_list.dart';


class home_page extends StatelessWidget {
  const home_page({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeStatefulWidget(),
    );
  }
}

class HomeStatefulWidget extends StatefulWidget {
  const HomeStatefulWidget({super.key});

  @override
  State<HomeStatefulWidget> createState() => HomeStatefulWidgetState();
}

class HomeStatefulWidgetState extends State<HomeStatefulWidget> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    listTeraphyWidget(),
    MyProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        // title: Text('Page title'),
        actions: [
          // Icon(Icons.history,
          // color: Color.fromRGBO(0, 74, 173, 1)),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.history),
            iconSize: 20,
            color: Color.fromRGBO(0, 74, 173, 1),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ListPesananUser()));
            },
        ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.notifications,color: Color.fromRGBO(0, 74, 173, 1)),
            
          ),
          Icon(Icons.menu,color: Color.fromRGBO(0, 74, 173, 1)),
        ],
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.record_voice_over),
            label: 'Therapy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(0, 74, 173, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
