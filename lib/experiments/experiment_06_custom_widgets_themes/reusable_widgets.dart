import 'package:flutter/material.dart';

import '../experiment_01_fundamentals/bmi_calculator.dart';

class NumberInputCard extends StatelessWidget {
  const NumberInputCard({
    required this.title,
    required this.value,
    required this.unit,
    required this.onChanged,
    required this.min,
    required this.max,
    super.key,
  });

  final String title;
  final double value;
  final String unit;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    value.toStringAsFixed(0),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Text(unit, style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            Slider(
              value: value.clamp(min, max),
              min: min,
              max: max,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  const ResultCard({required this.bmi, super.key});
  final double bmi;

  @override
  Widget build(BuildContext context) {
    final color = bmi < 18.5
        ? Colors.blue
        : bmi < 25
            ? Colors.green
            : bmi < 30
                ? Colors.orange
                : Colors.red;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text('Your BMI', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              bmi.toStringAsFixed(1),
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Chip(
              label: Text(BmiCalculator.category(bmi)),
              backgroundColor: color.withValues(alpha: 0.12),
              side: BorderSide.none,
            ),
            const SizedBox(height: 12),
            Text(BmiCalculator.guidance(bmi), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
