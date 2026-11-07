import 'package:flutter/material.dart';

/// Uses MediaQuery for screen information and LayoutBuilder for width-based layout.
class ResponsiveBmiLayout extends StatelessWidget {
  const ResponsiveBmiLayout({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final horizontalPadding = screen.width >= 700 ? 32.0 : 18.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final content = Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 22,
          ),
          child: child,
        );

        if (constraints.maxWidth >= 760) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: content,
            ),
          );
        }
        return content;
      },
    );
  }
}
