import 'package:flutter/material.dart';

import '../experiment_07_forms_validation/bmi_home_screen.dart';
import '../experiment_04_navigation/bmi_result_screen.dart';
import '../experiment_06_custom_widgets_themes/about_screen.dart';

class AppRoutes {
  static const home = '/';
  static const result = '/result';
  static const about = '/about';

  static Map<String, WidgetBuilder> get routes => {
        home: (_) => const BmiHomeScreen(),
        about: (_) => const AboutScreen(),
      };
}
