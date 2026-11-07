import 'package:flutter/material.dart';

/// Demonstrates fade and slide effects using implicit and explicit animation APIs.
class BmiFadeSlideAnimation extends StatefulWidget {
  const BmiFadeSlideAnimation({super.key});

  @override
  State<BmiFadeSlideAnimation> createState() => _BmiFadeSlideAnimationState();
}

class _BmiFadeSlideAnimationState extends State<BmiFadeSlideAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.35),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() => _visible = !_visible);
    if (_visible) {
      _controller.forward(from: 0);
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeTransition(
          opacity: _controller,
          child: SlideTransition(
            position: _slideAnimation,
            child: AnimatedOpacity(
              opacity: _visible ? 1 : 0,
              duration: const Duration(milliseconds: 350),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Icon(Icons.monitor_heart_outlined,
                          size: 42, color: colors.primary),
                      const SizedBox(height: 10),
                      Text(
                        'BMI result ready',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 6),
                      const Text('Your animated result panel'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: _toggleVisibility,
          child: Text(_visible ? 'Hide result' : 'Show result'),
        ),
      ],
    );
  }
}
