import 'package:calculator/constants/button_text_list.dart';
import 'package:calculator/constants/colors.dart';
import 'package:calculator/widgets/c_button.dart';
import 'package:calculator/widgets/c_text_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String displayText = '';
  String _input = '';
  String _operator = '';
  double _firstOperand = 0;
  double _secondOperand = 0;

  void _onButtonPressed(String text) {
    setState(() {
      if (text == 'AC') {
        displayText = '';
        _input = '';
        _operator = '';
        _firstOperand = 0;
        _secondOperand = 0;
      } else if (text == 'DE') {
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
          displayText = _input;
        }
      } else if (text == '=') {
        _secondOperand = double.tryParse(_input) ?? 0;
        _calculateResult();
      } else if (text == '+' || text == '-' || text == '×' || text == '÷') {
        if (_input.isNotEmpty) {
          _firstOperand = double.tryParse(_input) ?? 0;
          _input = '';
          _operator = text;
          displayText = text;
        }
      } else {
        _input += text;
        displayText = _input;
      }
    });
  }

  void _calculateResult() {
    double result = 0;
    switch (_operator) {
      case '+':
        result = _firstOperand + _secondOperand;
        break;
      case '-':
        result = _firstOperand - _secondOperand;
        break;
      case '×':
        result = _firstOperand * _secondOperand;
        break;
      case '÷':
        result = _firstOperand / _secondOperand;
        break;
    }
    displayText = result.toString();
    _input = result.toString();
    _operator = '';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.background,
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          backgroundColor: Pallete.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                CTextField(displayText: displayText),
                const SizedBox(height: 50),
                Expanded(
                  child: SafeArea(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF131111),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      height: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (var row in buttonText)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  for (var text in row)
                                    CButton(
                                      buttonText: text,
                                      onPressed: () => _onButtonPressed(text),
                                    ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
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
