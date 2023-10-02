import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:helipacontrol/pages/calculator.dart';
import 'package:helipacontrol/pages/result_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<Map<String, double>> notifier = ValueNotifier({});
  bool showResult = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        child: ClipRRect(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: const Image(
              image: AssetImage('./assets/images/bg2.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            children: [
              CalculatorPage(
                notifierMap: notifier,
                callback: () => setState(() {
                  showResult = true;
                }),
              ),
              showResult
                  ? ResultCard(
                      totalClean: notifier.value['totalClean'],
                      resultMember: notifier.value['totalMember'],
                      resultPanel: notifier.value['totalPanel'],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    ]);
  }
}
