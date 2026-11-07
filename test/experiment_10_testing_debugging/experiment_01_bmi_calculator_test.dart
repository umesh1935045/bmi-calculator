import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_flutter_lab/experiments/experiment_01_fundamentals/bmi_calculator.dart';

void main() {
  group('BmiCalculator', () {
    test('calculates BMI from kilograms and centimetres', () {
      expect(
        BmiCalculator.calculate(weightKg: 70, heightCm: 175),
        closeTo(22.86, 0.01),
      );
    });

    test('returns the expected adult category', () {
      expect(BmiCalculator.category(17.9), 'Underweight');
      expect(BmiCalculator.category(22.0), 'Normal range');
      expect(BmiCalculator.category(27.0), 'Overweight');
      expect(BmiCalculator.category(32.0), 'Obesity range');
    });

    test('rejects non-positive height and weight', () {
      expect(
        () => BmiCalculator.calculate(weightKg: 0, heightCm: 170),
        throwsArgumentError,
      );
      expect(
        () => BmiCalculator.calculate(weightKg: 65, heightCm: 0),
        throwsArgumentError,
      );
    });
  });
}
