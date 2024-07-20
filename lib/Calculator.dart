import 'package:flutter/material.dart';
import 'cal_button.dart';

var color_1 = const Color.fromARGB(255, 212, 212, 210);
var color_2 = const Color.fromARGB(255, 80, 80, 80);
var color_3 = const Color.fromARGB(255, 255, 149, 0);

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  CalculatorState();
  static String cal_screen_text = '0';
  static String cal_screen_text_small = '';
  @override
  Widget build(BuildContext context) {
    void updateDisplay() {
      setState(() {});
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 28, 28, 28),
          extendBodyBehindAppBar: true,
          body: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 1, color: color_1)),
            margin: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          cal_screen_text_small,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white60),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          cal_screen_text,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 60, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.white,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            cal_button(color_1, 'AC', updateDisplay),
                            cal_button(
                                color_1, '\u207A\u2215\u208B', updateDisplay),
                            cal_button(color_1, '%', updateDisplay),
                            cal_button(color_3, '\u00F7', updateDisplay),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            cal_button(color_2, '7', updateDisplay),
                            cal_button(color_2, '8', updateDisplay),
                            cal_button(color_2, '9', updateDisplay),
                            cal_button(color_3, '\u00D7', updateDisplay),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            cal_button(color_2, '4', updateDisplay),
                            cal_button(color_2, '5', updateDisplay),
                            cal_button(color_2, '6', updateDisplay),
                            cal_button(color_3, '\u002B', updateDisplay),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      cal_button(color_2, '1', updateDisplay),
                      cal_button(color_2, '2', updateDisplay),
                      cal_button(color_2, '3', updateDisplay),
                      cal_button(color_3, '\u002D', updateDisplay),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(60),
                            ),
                            splashColor: Colors.white,
                            onTap: () {
                              if (cal_screen_text != '0') {
                                setState(() {
                                  cal_screen_text = '${cal_screen_text}0';
                                });
                              }
                            },
                            child: Ink(
                              height: 75,
                              width: 155,
                              decoration: BoxDecoration(
                                  color: color_2,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50))),
                              child: const Center(
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      cal_button(color_2, '.', updateDisplay),
                      cal_button(color_3, '\u003D', updateDisplay),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
