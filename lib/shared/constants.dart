import 'package:flutter/material.dart';

final lulzInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.grey.shade300,
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(
        color: Colors.transparent,
        // ik :D
        width: 2,
      )),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2,
      )),
);
