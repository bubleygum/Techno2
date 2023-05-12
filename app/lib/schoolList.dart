import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/home.dart';

class schoolList extends StatelessWidget {
  const schoolList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Color.fromRGBO(0, 74, 173, 1)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'School Recommendation',
          style: TextStyle(color: Color.fromRGBO(0, 74, 173, 1)),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: schoolListWidget(),
      ),
    );
  }
}

class schoolListWidget extends StatelessWidget {
  const schoolListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          elevation: 5,
          child: ListTile(
            leading: Expanded(
              child: Image.network(
                'assets/images/art1.jpg',
                fit: BoxFit.cover,
                width: 1000
              ),
            ),
            title: Text('School Name'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Address'),
                Text('Phone number'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
