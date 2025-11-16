import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';

void main() => 
runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Custom buttons"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonStyle(),
            ButtonStyle(),
            ButtonStyle(),
            ButtonStyle(),
          ],
        ),
      ),
    ),
  )
);

class ButtonStyle extends StatefulWidget {

  const ButtonStyle({
    super.key,
  });

  @override
  State<ButtonStyle> createState() => _ButtonStyleState();
}

class _ButtonStyleState extends State<ButtonStyle> {

  bool isSelected = false;
  // getter medtho
  String get buttonText => isSelected ? "Selected" : "Not Selected";
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get buttonColor => isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () => {
            setState(() {
              isSelected = !isSelected;
            }),
          },
          child: Center(
            child: Text((buttonText), style: 
              TextStyle(
                color: textColor,
                fontSize: 24,
              )
            ),
          )
        ),
      ),
    );
  }
}
