import 'package:flutter/material.dart';

import '../experiment_06_custom_widgets_themes/reusable_widgets.dart';

class AnimatedResultPanel extends StatelessWidget {
  const AnimatedResultPanel({required this.bmi, super.key});
  final double bmi;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.88, end: 1),
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOutBack,
        builder: (context, scale, child) => Transform.scale(
          scale: scale,
          child: child,
        ),
        child: ResultCard(bmi: bmi),
      ),
    );
  }
}
