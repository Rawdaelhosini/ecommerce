import 'package:flutter/material.dart';

class loader extends StatelessWidget {
  final double scale;
  const loader({Key? key, this.scale = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: const CircularProgressIndicator(
        color: Colors.black,
        semanticsLabel: 'Circular progress bar',
      ),
    );
  }
}
