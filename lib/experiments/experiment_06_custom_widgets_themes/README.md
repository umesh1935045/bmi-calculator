# Experiment 6: Custom Widgets, Themes and Custom Styles

## Aim

1. Understand custom widgets in Flutter.
2. Create reusable UI components.
3. Apply application-wide themes for consistent styling.
4. Customize colors, typography, cards and buttons using Flutter's theme system.

## Files

- `bmi_custom_widgets.dart`: reusable section heading, measurement/result card and action button.
- `bmi_theme.dart`: centralized Material 3 light and dark themes.
- These components are designed to be imported by the BMI calculator screens.

## Concepts demonstrated

- Reusable `StatelessWidget` components
- Passing data through required and optional constructor parameters
- `ThemeData`, `ColorScheme` and `TextTheme`
- `CardThemeData` and `ElevatedButtonThemeData`
- Light and dark theme definitions

## Example usage

```dart
MaterialApp(
  theme: BmiTheme.light,
  darkTheme: BmiTheme.dark,
  home: const BmiHomeScreen(),
)
```

A screen can reuse the components like this:

```dart
BmiSectionTitle(
  title: 'Your measurements',
  subtitle: 'Enter your height and weight',
)

BmiValueCard(
  label: 'Height',
  value: '170',
  unit: 'cm',
  icon: Icons.height,
)

BmiActionButton(
  label: 'Calculate BMI',
  icon: Icons.calculate_outlined,
  onPressed: calculateBmi,
)
```

## Verification

From the Flutter project root, run:

```bash
flutter analyze
flutter test
```

Then run the app and verify the components in both light and dark themes. The app must import these files and select the themes in its root `MaterialApp` to display them.
