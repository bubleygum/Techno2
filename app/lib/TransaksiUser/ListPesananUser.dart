import 'package:apps/TransaksiUser/listKonsultasiUser.dart';
import 'package:apps/TransaksiUser/listPesananCaregiverUser.dart';
import 'package:apps/doctorList.dart';
import 'package:apps/home.dart';
import 'package:apps/profile_page.dart';
import 'package:apps/therapistList.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/listTherapy.dart';

import '../home_page.dart';

class ListPesananUser extends StatelessWidget {
  const ListPesananUser({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PesananUserStatefulWidget(),
    );
  }
}

class PesananUserStatefulWidget extends StatefulWidget {
  const PesananUserStatefulWidget({super.key});

  @override
  State<PesananUserStatefulWidget> createState() => doctorTherapistStatefulWidget();
}

class doctorTherapistStatefulWidget extends State<PesananUserStatefulWidget> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    ListKonsultasiUser(),
    ListPesananCaregiverUser(),
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
          leading: IconButton(
            icon: Icon(Icons.close, color: Color.fromRGBO(0, 74, 173, 1)),
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => home_page()), (Route<dynamic> route) => false),
          ),
          title: Text(
            'List Pesanan',
            style: TextStyle(color: Color.fromRGBO(0, 74, 173, 1)),
          ),
        
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userDoctor),
            label: 'Konsultasi',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userNurse),
            label: 'Caregiver',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(0, 74, 173, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
