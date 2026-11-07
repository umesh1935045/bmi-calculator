# Experiment 2 — Exploring Flutter Widgets and Layouts

**Manual title:** Exploring Flutter Widgets and Implementing Different Layout Structures using Row, Column, and Stack Widgets

## Aim

1. Understand the concept of Flutter widgets.
2. Explore commonly used widgets such as Text, Image, Icon, Container, and ElevatedButton.
3. Design user interfaces using Row, Column, and Stack layout widgets.
4. Understand widget nesting and layout management in Flutter.

## BMI calculator implementation

The `bmi_header.dart` file builds the BMI calculator heading using a nested Flutter widget tree.

| Widget | How it is used |
|---|---|
| `StatelessWidget` | Defines a header whose displayed content does not maintain changing internal state. |
| `Column` | Arranges the header row and supporting description vertically. |
| `Row` | Places the BMI icon and title section horizontally. |
| `Container` | Gives the BMI icon a fixed area, background color, alignment and rounded corners. |
| `Stack` | Places a small check indicator over the top-right corner of the icon container. |
| `Positioned` | Controls the check indicator's position inside the Stack. |
| `Icon` | Displays the heart/health symbol and check indicator. |
| `Text` | Displays the application title and description. |
| `SizedBox` | Adds spacing between nested widgets. |

The main BMI screen also uses `Scaffold`, `AppBar`, `ElevatedButton`, input widgets and nested layouts. These are part of the integrated application; this experiment keeps its own implementation focused on the reusable header.

The manual also introduces the `Image` widget (`Image.asset` and `Image.network`). A decorative image is not added to the BMI header because it is not needed for the calculator's purpose. Network images may also fail when a device has no internet connection.

## Widget tree (simplified)

```text
BmiHeader (StatelessWidget)
└── Column
    ├── Row
    │   ├── Stack
    │   │   ├── Container
    │   │   │   └── Icon (health)
    │   │   └── Positioned
    │   │       └── Container
    │   │           └── Icon (check)
    │   └── Expanded
    │       └── Column
    │           ├── Text (title)
    │           └── Text (subtitle)
    ├── SizedBox
    └── Text (description)
```

## Run the application

From the repository root:

```bash
flutter pub get
flutter run
```

## Precautions and common errors

- Maintain proper widget nesting and indentation.
- Use `const` widgets wherever possible when their values are fixed.
- Use `SizedBox` for spacing instead of unnecessary empty containers.
- Set `mainAxisAlignment` and `crossAxisAlignment` carefully to control alignment.
- If a `Row` or `Column` overflows, review its child sizes and consider `Expanded`, `Flexible`, or a scrollable widget where appropriate.

## Result

The BMI calculator header demonstrates Flutter widget composition and uses Row, Column and Stack to arrange and overlap interface elements.

## Note

This experiment demonstrates UI structure only. BMI calculation logic is implemented separately in Experiment 1.
```
