import 'package:flutter/material.dart';
import 'package:apps/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Home extends StatelessWidget {
  const Home({Key? key});
  Widget build(BuildContext context) {
    return Scaffold(body: _buildGridList());
  }

  Widget _buildGridList() {
    List<VoidCallback> buttonActions = [
      () {

      },
      () {
        // Action for second button
      },
      () {
        // Action for third button
      },
      () {
        // Action for fourth button
      },
    ];

    return ResponsiveGridList(
      rowMainAxisAlignment: MainAxisAlignment.center,
      desiredItemWidth: 100,
      minSpacing: 5,
      children: [
        _buildIconButton(
          Icons.record_voice_over,
          'Therapy',
          buttonActions[0],
        ),
        _buildIconButton(
          Icons.search,
          'Search',
          buttonActions[1],
        ),
        _buildIconButton(
          Icons.favorite,
          'Favorites',
          buttonActions[2],
        ),
        _buildIconButton(
          Icons.notifications,
          'Notifications',
          buttonActions[3],
        ),
      ],
    );
  }

  Widget _buildIconButton(
      IconData iconData, String label, VoidCallback onPressed) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            iconData,
            color: Color.fromRGBO(0, 74, 173, 1),
          ),
          onPressed: onPressed,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Color.fromRGBO(0, 74, 173, 1),
          ),
        ),
      ],
    );
  }
}
