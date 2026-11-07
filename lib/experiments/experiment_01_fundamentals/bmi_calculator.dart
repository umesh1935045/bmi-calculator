/// Core Dart calculations used by the BMI calculator.
class BmiCalculator {
  const BmiCalculator._();

  /// Calculates BMI from weight in kilograms and height in centimetres.
  static double calculate({
    required double weightKg,
    required double heightCm,
  }) {
    if (!weightKg.isFinite || weightKg <= 0) {
      throw ArgumentError.value(weightKg, 'weightKg', 'Must be positive.');
    }
    if (!heightCm.isFinite || heightCm <= 0) {
      throw ArgumentError.value(heightCm, 'heightCm', 'Must be positive.');
    }

    final heightM = heightCm / 100;
    return weightKg / (heightM * heightM);
  }

  /// Returns a commonly used adult BMI category.
  static String category(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal range';
    if (bmi < 30) return 'Overweight';
    return 'Obesity range';
  }

  /// Returns general educational guidance for the calculated BMI.
  static String guidance(double bmi) {
    if (bmi < 18.5) {
      return 'Consider discussing nutrition and weight goals with a healthcare professional.';
    }
    if (bmi < 25) {
      return 'Your BMI is within the commonly used adult reference range.';
    }
    if (bmi < 30) {
      return 'Consider discussing healthy habits and personal goals with a healthcare professional.';
    }
    return 'Consider discussing your results and health goals with a healthcare professional.';
  }

  /// Approximate adult weight range corresponding to BMI 18.5–24.9.
  static ({double minKg, double maxKg}) healthyWeightRange(double heightCm) {
    if (!heightCm.isFinite || heightCm <= 0) {
      throw ArgumentError.value(heightCm, 'heightCm', 'Must be positive.');
    }

    final heightM = heightCm / 100;
    return (
      minKg: 18.5 * heightM * heightM,
      maxKg: 24.9 * heightM * heightM,
    );
  }
}
