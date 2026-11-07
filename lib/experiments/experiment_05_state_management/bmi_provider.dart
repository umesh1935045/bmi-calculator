import 'package:flutter/foundation.dart';

import '../experiment_01_fundamentals/bmi_calculator.dart';

/// Shared BMI form/result state using ChangeNotifier and Provider.
class BmiProvider extends ChangeNotifier {
  double _heightCm = 170;
  double _weightKg = 65;
  double? _bmi;

  double get heightCm => _heightCm;
  double get weightKg => _weightKg;
  double? get bmi => _bmi;
  String? get category => _bmi == null ? null : BmiCalculator.category(_bmi!);

  void updateHeight(double value) {
    _heightCm = value;
    _bmi = null;
    notifyListeners();
  }

  void updateWeight(double value) {
    _weightKg = value;
    _bmi = null;
    notifyListeners();
  }

  void calculate() {
    _bmi = BmiCalculator.calculate(weightKg: _weightKg, heightCm: _heightCm);
    notifyListeners();
  }

  void clearResult() {
    _bmi = null;
    notifyListeners();
  }
}
