// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main(List<String> args) async {
  runApp(const SimpleCalculator());
}

class SimpleCalculator extends StatelessWidget {
  const SimpleCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const MainPage(
          title: 'KakuKu',
        ));
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String outPut = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  onButtonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "x") {
      num1 = double.parse(outPut);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == "=") {
      num2 = double.parse(outPut);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      } else if (operand == "-") {
        _output = (num1 - num2).toString();
      } else if (operand == "x") {
        _output = (num1 * num2).toString();
      } else if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    if (num1 > 0) {
      debugPrint('Num 1 : $num1');
    }
    if (num2 > 0) {
      debugPrint('Num 2 : $num2');
    }
    debugPrint(operand);

    setState(() {
      outPut = double.parse(_output).toStringAsFixed(0);
    });
  }

  buttonBuilder(String buttonText,
      {Color backgroundColour = Colors.white, textColor = Colors.black87}) {
    return Expanded(
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: OutlinedButton(
            onPressed: (() => onButtonPressed(buttonText)),
            style: OutlinedButton.styleFrom(backgroundColor: backgroundColour),
            child: Text(
              buttonText,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 18, color: Colors.black87),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Text(
                outPut,
                style:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            const Divider(),
            Column(
              children: [
                Row(
                  children: [
                    buttonBuilder("7"),
                    buttonBuilder("8"),
                    buttonBuilder("9"),
                    buttonBuilder("/")
                  ],
                ),
                Row(
                  children: [
                    buttonBuilder("4"),
                    buttonBuilder("5"),
                    buttonBuilder("6"),
                    buttonBuilder("x")
                  ],
                ),
                Row(
                  children: [
                    buttonBuilder("1"),
                    buttonBuilder("2"),
                    buttonBuilder("3"),
                    buttonBuilder("-")
                  ],
                ),
                Row(
                  children: [
                    buttonBuilder("0"),
                    buttonBuilder("00"),
                    buttonBuilder("+")
                  ],
                ),
                Row(
                  children: [
                    buttonBuilder("CLEAR"),
                    buttonBuilder("=",
                        backgroundColour: Colors.black, textColor: Colors.white)
                  ],
                )
              ],
            ),
            const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    'App by Dan Odin',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.black54),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
