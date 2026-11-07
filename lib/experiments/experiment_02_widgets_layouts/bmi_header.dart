import 'package:flutter/material.dart';

/// Header for the BMI calculator, composed from basic Flutter widgets.
///
/// This widget demonstrates a nested widget tree using Column, Row,
/// Container, Stack, Icon, Text and SizedBox.
class BmiHeader extends StatelessWidget {
  const BmiHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 58,
                  height: 58,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colors.primaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.monitor_heart_outlined,
                    size: 32,
                    color: colors.onPrimaryContainer,
                  ),
                ),
                Positioned(
                  right: -5,
                  top: -5,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: colors.tertiary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colors.surface,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.check,
                      size: 12,
                      color: colors.onTertiary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BMI Calculator',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text('Body Mass Index · Flutter Lab Project'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Enter your height and weight to calculate your BMI.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
