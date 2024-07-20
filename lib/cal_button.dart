import 'package:calculator/Calculator.dart';
import 'package:flutter/material.dart';

class cal_button extends StatelessWidget {
  static num number_1 = 0;
  static String Sign = '';
  static bool contOp = false;
  final Color _color;
  final String _text;
  final Function fun_1;
  const cal_button(Color color, String text, Function fun, {super.key})
      : _color = color,
        _text = text,
        fun_1 = fun;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(60)),
          splashColor: Colors.white,
          onTap: () {
            if (_text.compareTo('1') >= 0 && _text.compareTo('9') <= 0) {
              if (Sign == '') {
                if (CalculatorState.cal_screen_text == '0') {
                  CalculatorState.cal_screen_text = _text;
                } else if (CalculatorState.cal_screen_text != '0') {
                  CalculatorState.cal_screen_text += _text;
                }
              } else {
                if (contOp) {
                  CalculatorState.cal_screen_text = _text;
                } else {
                  if (CalculatorState.cal_screen_text == '0') {
                    CalculatorState.cal_screen_text = _text;
                  } else if (CalculatorState.cal_screen_text != '0') {
                    CalculatorState.cal_screen_text += _text;
                  }
                }
              }
              fun_1();
            } else {
              if (_text == 'AC') {
                CalculatorState.cal_screen_text_small = '';
                CalculatorState.cal_screen_text = '0';
                Sign = '';
              } else if (_text == '\u207A\u2215\u208B') {
                num temp_num = -(num.parse(CalculatorState.cal_screen_text));
                CalculatorState.cal_screen_text = temp_num.toString();
              } else if (_text == '%') {
                CalculatorState.cal_screen_text =
                    (num.parse(CalculatorState.cal_screen_text) / 100)
                        .toString();
              } else if (_text == '\u00F7') {
                applyfunction('/');
              } else if (_text == '\u00D7') {
                applyfunction('*');
              } else if (_text == '\u002B') {
                applyfunction('+');
              } else if (_text == '\u002D') {
                applyfunction('-');
              } else if (_text == '.') {
                if (!PointAlreadyexist(CalculatorState.cal_screen_text)) {
                  CalculatorState.cal_screen_text += '.';
                }
              } else if (_text == '\u003D') {
                performopertion(Sign);
                Sign = '';
              }
              fun_1();
            }
          },
          child: Ink(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              color: _color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                _text,
                style: TextStyle(
                  color: retColor(),
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color retColor() {
    if (_color == const Color.fromARGB(255, 212, 212, 210)) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  bool PointAlreadyexist(String number) {
    int dotCount = number.split(".").length - 1;
    if (dotCount == 1) {
      return true;
    } else {
      return false;
    }
  }

  void applyfunction(String s) {
    if (Sign == '') {
      Sign = s;
      number_1 = num.parse(CalculatorState.cal_screen_text);
      CalculatorState.cal_screen_text = '0';
    } else {
      print(Sign);
      performopertion(Sign);
      Sign = s;
    }
    updatesmallscreen();
  }

  void performopertion(String sign) {
    print('Perform Opertaion here');
    num result;
    if (sign == '/') {
      result = number_1 / num.parse(CalculatorState.cal_screen_text);
    } else if (sign == '*') {
      result = number_1 * num.parse(CalculatorState.cal_screen_text);
    } else if (sign == '+') {
      result = number_1 + num.parse(CalculatorState.cal_screen_text);
    } else {
      result = number_1 - num.parse(CalculatorState.cal_screen_text);
    }
    if (result.remainder(1) == 0) {
      CalculatorState.cal_screen_text = result.toInt().toString();
    } else {
      CalculatorState.cal_screen_text = result.toStringAsFixed(3);
    }
    number_1 = result;
    contOp = true;
  }

  void updatesmallscreen() {
    String num_text = '';
    if (number_1.remainder(1) == 0) {
      num_text = number_1.toInt().toString();
    } else {
      num_text = number_1.toStringAsFixed(3);
    }

    if (Sign == '/') {
      CalculatorState.cal_screen_text_small = '$num_text \u00F7';
    } else if (Sign == '*') {
      CalculatorState.cal_screen_text_small = '$num_text \u00D7';
    } else if (Sign == '+') {
      CalculatorState.cal_screen_text_small = '$num_text \u002B';
    } else if (Sign == '-') {
      CalculatorState.cal_screen_text_small = '$num_text \u002D';
    }
    print("small screen");
  }
}
