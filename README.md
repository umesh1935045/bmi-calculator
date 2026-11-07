# BMI Calculator

A BMI (Body Mass Index) Calculator developed using concepts from the Flutter

The project demonstrates Flutter and Dart concepts through one BMI calculator application. Each experiment focuses on a particular topic and contains the relevant implementation.

## Experiments

| Experiment | Topic                         | Implementation in the BMI Calculator                                   |
| ---------- | ----------------------------- | ---------------------------------------------------------------------- |
| 1          | Flutter and Dart Fundamentals | BMI formula, input conversion, BMI categories and healthy weight range |
| 2          | Widgets and Layouts           | Text, icons, cards, buttons, rows and columns                          |
| 3          | Responsive UI                 | MediaQuery and LayoutBuilder for different screen sizes                |
| 4          | Navigation                    | Navigation between calculator, result and About screens                |
| 5          | State Management              | Provider, ChangeNotifier and application state                         |
| 6          | Custom Widgets and Themes     | Reusable widgets and Material theme                                    |
| 7          | Forms and Validation          | Height and weight input validation                                     |
| 8          | Animations                    | Animated BMI result panel                                              |
| 9          | REST API                      | HTTP GET request, JSON parsing and error handling                      |
| 10         | Testing and Debugging         | Unit tests and widget tests                                            |

## Technologies Used

- Flutter
- Dart
- Provider
- HTTP package
- JSON
- Flutter Test

## How to Run the Project

### 1. Install Flutter

Install the Flutter SDK and configure an emulator or connect an Android device.

Check your Flutter installation:

```bash
flutter doctor
```

### 2. Get the Dependencies

Open a terminal in the project directory and run:

```bash
flutter pub get
```

### 3. Run the Application

```bash
flutter run
```

### 4. Run Tests

```bash
flutter test
```

### 5. Check Code Quality

```bash
dart format lib test
flutter analyze
```

## BMI Calculation

The application calculates BMI using:

```text
BMI = Weight (kg) / Height (m)²
```

The application uses common adult BMI categories for educational demonstration. BMI is a screening measure, not a medical diagnosis.

## Project Structure

```text
bmi-calculator/
├── lib/
│   ├── main.dart
│   └── experiments/
│       ├── experiment_01_fundamentals/
│       ├── experiment_02_widgets_layouts/
│       ├── experiment_03_responsive_ui/
│       ├── experiment_04_navigation/
│       ├── experiment_05_state_management/
│       ├── experiment_06_custom_widgets_themes/
│       ├── experiment_07_forms_validation/
│       ├── experiment_08_animations/
│       ├── experiment_09_rest_api/
│       └── experiment_10_testing_debugging/
├── test/
├── pubspec.yaml
└── README.md
```

## API Demonstration

Experiment 9 uses the JSONPlaceholder public test API to demonstrate an HTTP GET request, JSON decoding and error handling.

The BMI calculation itself is performed locally. The API demonstration is not a medical service.

## Learning Objective

The objective of this project is to understand Flutter development concepts by applying each experiment's topic to a practical BMI Calculator application.
