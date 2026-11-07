# Experiment 8: Implementing UI Animations in Flutter

## Aim

1. Understand the fundamentals of animation in Flutter.
2. Implement animations using Flutter's animation framework.
3. Create fade and slide animations for UI elements.
4. Improve user experience using animated widgets.

## Files

- `bmi_animated_container.dart`: demonstrates an animated BMI result card using `AnimatedContainer`.
- `bmi_fade_slide_animation.dart`: demonstrates fade and slide effects, including an `AnimationController`, `Tween` and `CurvedAnimation`.

## Concepts demonstrated

- Implicit animations: Flutter animates changed properties automatically.
- `AnimatedContainer`: animates size, padding, color and border radius.
- `AnimatedOpacity`: animates transparency.
- `FadeTransition` and `SlideTransition`: animate a widget using animation values.
- Explicit animations: `AnimationController`, `Tween`, `CurvedAnimation` and `SingleTickerProviderStateMixin`.
- Controller cleanup using `dispose()`.

## Example usage

Import the widgets into a screen and place them in a scrollable layout:

```dart
ListView(
  padding: const EdgeInsets.all(16),
  children: const [
    BmiAnimatedContainer(initialBmi: 22.5),
    SizedBox(height: 24),
    BmiFadeSlideAnimation(),
  ],
)
```

## Run checks

From the Flutter project root:

```bash
dart format lib/experiments/experiment_08_animations
flutter analyze
flutter test
```

Run the screen on an emulator or device and tap the buttons to observe the transitions. These files are standalone experiment widgets; they are not automatically connected to the app entry point.
