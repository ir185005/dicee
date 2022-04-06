import 'package:flutter/material.dart';

Widget dice(String dice, Function function) {
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
