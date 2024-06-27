import 'package:flutter/material.dart';

class ChoiceContainer extends StatelessWidget {
  final bool isTap;
  final Color colors;
  const ChoiceContainer({
    super.key,
    required this.isTap,
    required this.colors,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: colors,
      ),
      child: isTap
          ? const Icon(
              Icons.check,
              color: Colors.white,
              size: 18,
            )
          : const Text(""),
    );
  }
}
