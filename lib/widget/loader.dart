import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final double scale;

  const Loader({Key? key, required this.scale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: const CircularProgressIndicator(
        color: Colors.black,
        semanticsLabel: "Circular program bar",
      ),
    );
  }
}
