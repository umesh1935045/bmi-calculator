/// Reusable validation helpers for the BMI input form.
class BmiFormValidators {
  const BmiFormValidators._();

  static String? requiredText(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? email(String? value) {
    final requiredError = requiredText(value, fieldName: 'Email');
    if (requiredError != null) return requiredError;

    final pattern = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    if (!pattern.hasMatch(value!.trim())) return 'Enter a valid email address';
    return null;
  }

  static String? phone(String? value) {
    final requiredError = requiredText(value, fieldName: 'Phone number');
    if (requiredError != null) return requiredError;

    final digits = value!.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 10) return 'Enter a 10-digit phone number';
    return null;
  }

  static String? positiveNumber(
    String? value, {
    required String fieldName,
    required double minimum,
    required double maximum,
  }) {
    final requiredError = requiredText(value, fieldName: fieldName);
    if (requiredError != null) return requiredError;

    final number = double.tryParse(value!.trim());
    if (number == null) return 'Enter a valid number';
    if (!number.isFinite || number < minimum || number > maximum) {
      return 'Enter a value from $minimum to $maximum';
    }
    return null;
  }

  static String? height(String? value) => positiveNumber(
        value,
        fieldName: 'Height',
        minimum: 50,
        maximum: 250,
      );

  static String? weight(String? value) => positiveNumber(
        value,
        fieldName: 'Weight',
        minimum: 10,
        maximum: 500,
      );
}
