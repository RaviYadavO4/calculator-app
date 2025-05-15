import 'package:calculator_app/provider/calculation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants.dart';

enum Shape {
  square,
  circle,
  stadium,
}

class CalculatorButton extends StatefulWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double width;
  final Shape shape;

  const CalculatorButton({
    Key? key,
    required this.text,
    this.textColor = kSecondaryColor,
    this.fontSize = 40,
    this.fontWeight = FontWeight.bold,
    this.width = 68,
    this.shape = Shape.square,
  }) : super(key: key);

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.shape == Shape.circle
        ? null
        : BorderRadius.circular(widget.shape == Shape.square ? 20 : 36);
    final shape =
        widget.shape == Shape.circle ? BoxShape.circle : BoxShape.rectangle;

    return Listener(
      onPointerDown: (_) => setState(() => isPressed = true),
      onPointerUp: (_) {
        setState(() => isPressed = false);

        final provider = context.read<CalculationProvider>();
        if (widget.shape == Shape.square) {
          provider.addSign(widget.text);
        } else {
          provider.addNumber(widget.text);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width,
        height: 68,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          shape: shape,
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(-2, -2),
              blurRadius: 5,
              color: const Color(0xFFFFFFFF),
            ),
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 5,
              color: const Color(0xFFFFFFFF),
            ),
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 5,
              color: isPressed ? Colors.transparent : const Color(0xCCFFFFFF),
            ),
            BoxShadow(
              offset: const Offset(-2, -2),
              blurRadius: 5,
              color: isPressed ? Colors.transparent : const Color(0x66838E9E),
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              color: widget.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
