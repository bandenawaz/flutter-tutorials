import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function(String) onTap;
  final Color? color;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => onTap(text),
          style: ElevatedButton.styleFrom(
            backgroundColor:
                color ?? Theme.of(context).primaryColor, // background color
            textStyle: TextStyle(fontSize: 24),
            padding: EdgeInsets.all(20),
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
