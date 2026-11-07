import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About this lab project')),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'This BMI Calculator demonstrates the ten topics in the Flutter lab manual. '
          'It is an educational project. BMI is a screening measure and not a medical diagnosis.',
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
    );
  }
}
