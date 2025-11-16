import 'package:flutter/material.dart';

void main () {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProgressCard(),
              ProgressCard(),
              ProgressCard(),
            ],
          ),
        ),
      ),
    )
  );
}

class ProgressCard extends StatefulWidget {
  const ProgressCard({
    super.key,
  });

  @override
  State<ProgressCard> createState() => ProgressCardState();
}


class ProgressCardState extends State<ProgressCard> {

  int score = 0;
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

  double barWidth() {
    double width = 0;
    width = (score / maxScore) * 350;
    print('widht: $width');
    return width;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // padding: EdgeInsets.symmetric(horizontal: 50),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'My score in Flutter',
            style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: decrease, 
                icon: Icon(Icons.remove),
                color: Colors.black,
              ),
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
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              Container(
                height: 50,
                width: barWidth(),
                decoration: BoxDecoration(
                  color: progressBarColor(),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}