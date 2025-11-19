import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];


class ImageSlider extends StatefulWidget {

  const ImageSlider({
    super.key,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex = 0;
  void nextImages() {
    setState(() {
      currentIndex++;
      // if currentindex = 5, then goes back to 0
      if (currentIndex >= images.length) {
        currentIndex = 0;
      }
    });
  }

  void previousImages() {
    setState(() {
      currentIndex--;
      if (currentIndex < 0) {
        currentIndex = images.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: previousImages,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: nextImages,
            ),
          ),
        ],
      ),
      body: Image.asset(images[currentIndex]),
    );
  }
}
