import 'package:flutter/material.dart';

class ValuesRange extends StatefulWidget {
  final double firstValue;
  final double middleValue;
  final double lastValue;

  const ValuesRange(
      {super.key,
      required this.firstValue,
      required this.middleValue,
      required this.lastValue});

  @override
  State<ValuesRange> createState() => _ValuesRangeState();
}

class _ValuesRangeState extends State<ValuesRange> {
  double get middlePercentage =>
      ((widget.middleValue - widget.firstValue).abs() * 100) /
      (widget.lastValue - widget.firstValue).abs();

  late Container? backgroundContainer;

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width - 48;

    return Stack(
      children: [
        backgroundContainer = Container(
          width: widthSize,
          height: 16,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.white,
                    spreadRadius: 1,
                    blurRadius: 0.5,
                    offset: Offset(0, -1)),
                BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 0.8,
                    blurRadius: 0.5,
                    offset: Offset(0, 1.5))
              ]),
        ),
        backgroundContainer != null
            ? Container(
                width: backgroundContainer!.constraints!.maxWidth *
                    (middlePercentage / 100),
                height: 16,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue.shade300),
              )
            : Container(),
      ],
    );
  }
}
