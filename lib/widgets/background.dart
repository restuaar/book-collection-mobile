import 'package:flutter/material.dart';

class MyBackground extends StatelessWidget {
  const MyBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: const Opacity(
        opacity: 0.05,
        child: Image(
          image: AssetImage("images/pattern_book.jpg"),
          repeat: ImageRepeat.repeat,
        ),
      ),
    );
  }
}
