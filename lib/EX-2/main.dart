import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: const Text("Favorite cards"),
    ),
    body: Column(
      children: [
        Card(),
        Card(),
        Card(),
      ],
    ),
  ),
));

class Card extends StatefulWidget {

  const Card({
    super.key,
  });

  @override
  State<Card> createState() => CardState();
}

class CardState extends State<Card> {

  bool isFavorite = false;
  // getter method
  Color get iconColor => isFavorite ? Colors.red : Colors.grey;

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
                    Text('Title', style: TextStyle(color: Colors.blue, fontSize: 20)),
                    Text('Description', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              }, 
              icon: Icon(Icons.favorite),
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}
