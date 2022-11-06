import 'package:flutter/material.dart';

const double topPadding = 60;
const double rightPadding = 20;

class LikeButton extends StatelessWidget {
  const LikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: topPadding,
          right: rightPadding,
        ),
        child: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
      ),
    );
  }
}
