import 'package:flutter/material.dart';

class Exercise2 extends StatelessWidget {
  const Exercise2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          Card(title: 'Title 1', description: 'Description 1'),
          Card(title: 'Title 2', description: 'Description 2'),
          Card(title: 'Title 3', description: 'Description 3'),
        ],
      ),
    );
  }
}

class Card extends StatefulWidget {

  final String title;
  final String description;

  const Card({
    required this.title,
    required this.description,
    super.key,
  });

  @override
  State<Card> createState() => CardState();
}

class CardState extends State<Card> {

  bool isFavorite = false;
  String get cardTitle => widget.title;
  String get cardDescription => widget.description;
  // getter method
  Color get iconColor {
    if (isFavorite) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }
  
  void buttonClick() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      // YOUR CODE
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(cardTitle, style: TextStyle(color: Colors.blue, fontSize: 20)),
                    Text(cardDescription, style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: buttonClick,
              icon: Icon(Icons.favorite),
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}
