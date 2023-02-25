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
        title: 'Cakoolator',
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

  buttonPressed(String buttonText) {
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

  buildButton(String buttonText,
      {Color backgroundColour = Colors.white, textColor = Colors.black87}) {
    return Expanded(
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(2.9),
          child: OutlinedButton(
            onPressed: (() => buttonPressed(buttonText)),
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
          style: const TextStyle(fontSize: 12, color: Colors.black87),
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
              height: 40,
            ),
            const Divider(),
            Column(
              children: [
                Row(
                  children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/")
                  ],
                ),
                Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("x")
                  ],
                ),
                Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-")
                  ],
                ),
                Row(
                  children: [
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+")
                  ],
                ),
                Row(
                  children: [
                    buildButton("CLEAR"),
                    buildButton("=",
                        backgroundColour: Colors.black, textColor: Colors.white)
                  ],
                )
              ],
            ),
            const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
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
