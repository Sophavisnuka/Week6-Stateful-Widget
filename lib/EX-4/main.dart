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
              Container(
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: 50),
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
                          onPressed: () {}, 
                          icon: Icon(Icons.remove),
                          color: Colors.black,
                        ),
                        IconButton(
                          onPressed: () {}, 
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
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    )
  );
}