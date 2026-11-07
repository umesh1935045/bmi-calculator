import 'package:flutter/material.dart';

/// Reusable section heading for the BMI calculator.
class BmiSectionTitle extends StatelessWidget {
  const BmiSectionTitle({
    super.key,
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.titleMedium),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(subtitle!, style: textTheme.bodySmall),
        ],
      ],
    );
  }
}

/// Reusable card for displaying a BMI measurement or result.
class BmiValueCard extends StatelessWidget {
  const BmiValueCard({
    super.key,
    required this.label,
    required this.value,
    this.unit,
    this.icon,
  });

  final String label;
  final String value;
  final String? unit;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null) Icon(icon, color: colors.primary),
            Text(label, style: textTheme.labelLarge),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Flexible(
                  child: Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.headlineSmall,
                  ),
                ),
                if (unit != null) ...[
                  const SizedBox(width: 5),
                  Text(unit!, style: textTheme.bodySmall),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Reusable action button that follows the app's Material theme.
class BmiActionButton extends StatelessWidget {
  const BmiActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isExpanded = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon == null ? const SizedBox.shrink() : Icon(icon),
      label: Text(label),
    );

    return isExpanded ? SizedBox(width: double.infinity, child: button) : button;
  }
}
