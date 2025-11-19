import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main () {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                ProgressCard(name: 'Flutter'),
                ProgressCard(name: 'Dart'),
                ProgressCard(name: 'React'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressCard extends StatefulWidget {

  final String name;

  const ProgressCard({
    super.key,
    required this.name
  });

  @override
  State<ProgressCard> createState() => ProgressCardState();
}


class ProgressCardState extends State<ProgressCard> {

  String get getName => widget.name;

  int score = 0;
  double width = 0;
  final int maxScore = 10;

  void increase() {
    setState(() {
      if (score < maxScore) {
        score++;
      } else if (score == maxScore) {
        score = maxScore;
      }
      print('score: $score');
    });
  }

  void decrease () {
    setState(() {
      if (score > 0) {
        score--;
      } else if (score < 0) {
        score = 0;
      }
    });
  }

  double progressBarWidth () {
    width = score / maxScore;
    print(width);
    return width; 
  }

  Color progressBarColor () {
    if (score == 0) {
      return Colors.transparent;
    } else if (score <= 3) {
      return const Color.fromARGB(255, 148, 229, 150);
    } else if (score >= 4 && score <= 7) {
      return const Color.fromARGB(255, 63, 185, 67);
    } else if (score > 8){
      return const Color.fromARGB(255, 9, 121, 13); 
    }
    return const Color.fromARGB(255, 9, 121, 13); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: 50),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('My score in $getName', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: decrease, 
                icon: Icon(Icons.remove),
                color: Colors.black,
              ),
              Text('$score', style: TextStyle(color: Colors.black, fontSize: 20)),
              IconButton(
                onPressed: increase, 
                icon: Icon(Icons.add),
                color: Colors.black,
              )
            ],
          ),
          Stack(
            children: <Widget>[
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              FractionallySizedBox(
                widthFactor: progressBarWidth(),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: progressBarColor(),
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}