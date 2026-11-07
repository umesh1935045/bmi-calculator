import 'package:flutter/material.dart';

import '../experiment_01_fundamentals/bmi_calculator.dart';
import '../experiment_06_custom_widgets_themes/reusable_widgets.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({
    required this.bmi,
    required this.heightCm,
    super.key,
  });

  final double bmi;
  final double heightCm;

  @override
  Widget build(BuildContext context) {
    final range = BmiCalculator.healthyWeightRange(heightCm);
    return Scaffold(
      appBar: AppBar(title: const Text('Your BMI result')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ResultCard(bmi: bmi),
                const SizedBox(height: 16),
                Text(
                  'Approximate adult reference weight range for this height: '
                  '${range.minKg.toStringAsFixed(1)}–${range.maxKg.toStringAsFixed(1)} kg',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Back to calculator'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
