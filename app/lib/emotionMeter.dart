import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:apps/home.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:apps/emotionMeter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        child: EmotionMeterGrid(),
      ),
    );
  }
}

class EmotionMeterGrid extends StatelessWidget {
  const EmotionMeterGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        GestureDetector(
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('I feel happy right now!'),
              content:
                  const Icon(FontAwesomeIcons.faceLaugh, color: Color.fromRGBO(27, 94, 32, 1), size: 50,),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          child: new Container(
            height: 50,
            color: Color.fromRGBO(27, 94, 32, 0.5),
            child: const Center(child: Text('I am happy / relaxed')),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('I feel okay right now!'),
              content:
                  const Icon(FontAwesomeIcons.faceSmile, color: Color.fromRGBO(0, 74, 173, 1),size: 50,),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          child: new Container(
            height: 50,
            color: Color.fromRGBO(92, 134, 200, 0.5),
            child: const Center(child: Text('I am feeling ok')),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('I feel a little nervous right now!'),
              content:
                  const Icon(FontAwesomeIcons.faceMeh, color: Color.fromRGBO(178, 160, 1, 1),size: 50,),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          child: new Container(
            height: 50,
            color: Color.fromRGBO(255, 235, 59, 0.5),
            child: const Center(child: Text('I am a little nervous')),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('I feel angry right now!'),
              content:
                  const Icon(FontAwesomeIcons.faceFrownOpen, color: Color.fromRGBO(255, 152, 0,1),size: 50,),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          child: new Container(
            height: 50,
            color: Color.fromRGBO(255, 152, 0, 0.5),
            child: const Center(child: Text('I am getting angry')),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('I feel very angry right now!'),
              content:
                  const Icon(FontAwesomeIcons.faceAngry, color: Color.fromRGBO(244, 67, 54, 1),size: 50,),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          child: new Container(
            height: 50,
            color: Color.fromRGBO(244, 67, 54, 0.5),
            child: const Center(child: Text('I am going to explode')),
          ),
        ),
      ],
    ));
  }
}
