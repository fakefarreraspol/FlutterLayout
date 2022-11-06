import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: Row(
          children: const [
            BackButton(color: Colors.black),
            
          ],
        ),
      ),
    );
  }
}
