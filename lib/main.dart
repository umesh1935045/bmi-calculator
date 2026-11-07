import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'experiments/experiment_04_navigation/app_routes.dart';
import 'experiments/experiment_05_state_management/bmi_provider.dart';
import 'experiments/experiment_06_custom_widgets_themes/app_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BmiProvider(),
      child: const BmiLabApp(),
    ),
  );
}

class BmiLabApp extends StatelessWidget {
  const BmiLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Flutter Lab',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}
