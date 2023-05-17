import 'package:apps/home.dart';
import 'package:apps/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/listTherapy.dart';

class doctor_therapist extends StatelessWidget {
  const doctor_therapist({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: doctor_therapistStatefulWidget(),
    );
  }
}

class doctor_therapistStatefulWidget extends StatefulWidget {
  const doctor_therapistStatefulWidget({super.key});

  @override
  State<doctor_therapistStatefulWidget> createState() => doctorTherapistStatefulWidget();
}

class doctorTherapistStatefulWidget extends State<doctor_therapistStatefulWidget> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    listTherapyState(),
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
          Icon(Icons.history,
          color: Color.fromRGBO(0, 74, 173, 1)),
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
            label: 'Doctor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.record_voice_over),
            label: 'Therapist',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(0, 74, 173, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
