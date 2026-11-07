# Experiment 1 — Flutter & Dart Fundamentals

**Manual title:** Installation of Flutter & Dart SDK and Introduction to Dart Programming

## Aim

- Understand the Flutter and Dart development environment.
- Use basic Dart syntax, variables, data types, arithmetic operations, functions and conditional statements.
- Apply those Dart fundamentals to the BMI calculator.

## BMI Calculator Implementation

The `bmi_calculator.dart` file contains the calculation logic used by the application:

- **Variables and data types:** Uses `double` values for weight, height and BMI.
- **Arithmetic:** Converts height from centimetres to metres and calculates `weight / height²`.
- **Functions:** Provides reusable methods to calculate BMI and the approximate adult healthy-weight range.
- **Conditional statements:** Classifies BMI into commonly used adult categories.
- **Input checks:** Rejects non-finite or non-positive height and weight values.

This folder contains only the Experiment 1 part of the complete BMI calculator. Later experiments add the user interface, navigation, state management and other features.

## Development Environment Commands

Install the Flutter SDK and configure its `bin` directory in the Windows `PATH`. Install Android Studio or VS Code and the Flutter/Dart extensions, as described in the lab manual.

Check the setup:

```bash
flutter doctor
flutter --version
```

Create a Flutter project (the main project has already been created for this lab):

```bash
flutter create bmi_calculator
```

From the root of this repository, get packages and run the integrated BMI application:

```bash
flutter pub get
flutter run
```

## Source File

- `bmi_calculator.dart` — reusable Dart BMI calculations and category logic.

## Note

BMI categories and the approximate healthy-weight range are educational adult reference calculations, not a medical diagnosis.
