import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/home.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:apps/emotionMeter.dart';

class PictureExchange extends StatelessWidget {
  const PictureExchange({Key? key}) : super(key: key);

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
        child: PictureExchangeWidget(),
      ),
    );
  }
}

class PictureExchangeWidget extends StatelessWidget {
  const PictureExchangeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> buttonLabels = [
      'Happy',
      'Sad',
      'Shocked',
      'Angry',
      'Disgusted',
      'Sick',
    ];
    return ResponsiveGridList(
      desiredItemWidth: 150,
      minSpacing: 10,
      children: List.generate(
        6,
        (index) => Column(
          children: [
            Image.network(
              'assets/images/emotion${index + 1}.jpg',
              fit: BoxFit.cover,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EmotionMeter()));
              },
              child: Text(buttonLabels[index]),
            ),
          ],
        ),
      ),
    );
  }
}
