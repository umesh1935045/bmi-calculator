# Experiment 7: Forms, Input Fields and Form Validation

## Aim

1. Design forms using Flutter input widgets.
2. Collect user information through different input fields.
3. Validate user input before submission.
4. Display useful error messages for invalid inputs.

## Files

- `bmi_input_form.dart`: reusable stateful form for personal details and BMI measurements.
- `bmi_form_validators.dart`: reusable validation helpers for required text, email, phone, height and weight.

## Flutter concepts demonstrated

- `Form` and `GlobalKey<FormState>`
- `TextFormField`, controllers and keyboard types
- `DropdownButtonFormField`
- `CheckboxListTile` and custom `FormField` validation
- `validator`, `validate()`, form reset and error messages
- `StatefulWidget`, `setState()` and controller disposal

## Example integration

Import the form into a screen and provide a submission callback:

```dart
BmiInputForm(
  onSubmit: (values) {
    final heightCm = double.parse(values['heightCm']!);
    final weightKg = double.parse(values['weightKg']!);

    // Pass the validated measurements to your BMI calculation flow.
  },
)
```

Place the widget in a screen with a bounded body, such as a `Scaffold` body. The form itself uses a `ListView` so it can scroll on smaller devices.

## Validation rules

- Name: cannot be empty.
- Email: must use a basic valid email format.
- Phone: must contain exactly 10 digits (non-digit separators are ignored).
- Height: must be between 50 and 250 cm.
- Weight: must be between 10 and 500 kg.
- Gender: an option must be selected.
- Declaration: must be checked before submission.

These are educational client-side checks, not server-side identity or medical validation.

## Run checks

From the Flutter project root:

```bash
dart format lib/experiments/experiment_07_forms_validation
flutter analyze
flutter test
```

To use this form in the running application, import it into a screen and connect its `onSubmit` callback to the app's existing BMI calculation flow. This experiment's files are modular examples; they do not modify the app entry point or automatically integrate themselves.
