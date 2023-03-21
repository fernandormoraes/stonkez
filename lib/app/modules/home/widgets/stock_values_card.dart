import 'package:flutter/material.dart';

class StockValuesCard extends StatelessWidget {
  final double height;
  final Widget child;

  const StockValuesCard({super.key, required this.child, this.height = 120});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
