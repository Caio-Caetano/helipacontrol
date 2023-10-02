import 'package:flutter/material.dart';

Widget generateTitle(String text) => Text(text, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold), textAlign: TextAlign.center);

Widget generateResultText(String text, {Color? bgColor}) => Container(
      width: 330,
      decoration: BoxDecoration(
        color: bgColor!.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1, color: bgColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text, style: const TextStyle(fontSize: 22), textAlign: TextAlign.center),
      ),
    );
