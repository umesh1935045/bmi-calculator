import 'package:flutter/material.dart';

/// Demonstrates implicit animation of a BMI result card.
class BmiAnimatedContainer extends StatefulWidget {
  const BmiAnimatedContainer({
    super.key,
    this.initialBmi = 22.5,
  });

  final double initialBmi;

  @override
  State<BmiAnimatedContainer> createState() => _BmiAnimatedContainerState();
}

class _BmiAnimatedContainerState extends State<BmiAnimatedContainer> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: _expanded ? 300 : 220,
          padding: EdgeInsets.all(_expanded ? 28 : 18),
          decoration: BoxDecoration(
            color: _expanded ? colors.primaryContainer : colors.surfaceContainer,
            borderRadius: BorderRadius.circular(_expanded ? 28 : 16),
            border: Border.all(color: colors.outlineVariant),
          ),
          child: Column(
            children: [
              Text('Your BMI', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(
                widget.initialBmi.toStringAsFixed(1),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: colors.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              if (_expanded) ...[
                const SizedBox(height: 8),
                const Text('A sample BMI value for animation practice'),
              ],
            ],
          ),
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () => setState(() => _expanded = !_expanded),
          child: Text(_expanded ? 'Collapse card' : 'Expand card'),
        ),
      ],
    );
  }
}
