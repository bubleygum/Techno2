import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/home.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:apps/emotionMeter.dart';

class EmotionMeter extends StatelessWidget {
  const EmotionMeter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Color.fromRGBO(0, 74, 173, 1)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Recognizing Emotion',
          style: TextStyle(color: Color.fromRGBO(0, 74, 173, 1)),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: emotionMeter(),
      ),
    );
  }
}

class emotionMeter extends StatelessWidget {
  const emotionMeter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Color> buttonColors = [
      Colors.green[900]!, // Dark Green
      Colors.green[400]!, // Light Green
      Colors.yellow, // Yellow
      Colors.orange, // Orange
      Colors.red, // Red
    ];
    return ResponsiveGridList(
      desiredItemWidth: 150,
      minSpacing: 10,
      children: List.generate(
        5,
        (index) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: buttonColors[index],
              child: TextButton(
                onPressed: () {
                  // Handle button press here
                  print('Button pressed: ${index + 1}');
                },
                child: Text(
                  '${index + 1}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
