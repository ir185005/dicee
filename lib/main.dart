import 'dart:math';

import 'package:flutter/material.dart';

import 'dice_widget.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeNumber() {
    Random random = Random();
    leftDiceNumber = random.nextInt(6) + 1;
    rightDiceNumber = random.nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            'Dicee',
          )),
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      changeNumber();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('images/dice$leftDiceNumber.png'),
                  ),
                ),
              ),
              AnotherDice(
                  function: () {
                    setState(() {
                      changeNumber();
                    });
                  },
                  dice: 'images/dice$rightDiceNumber.png')
            ],
          ),
        ),
      ),
    );
  }
}

// Widget dice(String dice, Function function) {
//   return Expanded(
//     child: GestureDetector(
//       onTap: () {
//         function();
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Image.asset(dice),
//       ),
//     ),
//   );
// }

class AnotherDice extends StatelessWidget {
  const AnotherDice({Key? key, required this.function, required this.dice})
      : super(key: key);
  final String dice;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(dice),
        ),
      ),
    );
  }
}
