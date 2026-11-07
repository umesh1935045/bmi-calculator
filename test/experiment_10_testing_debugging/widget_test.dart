import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_flutter_lab/main.dart';

void main() {
  testWidgets('BMI calculator screen renders its main controls', (tester) async {
    await tester.pumpWidget(const BmiLabApp());
    await tester.pumpAndSettle();

    expect(find.text('BMI Flutter Lab'), findsOneWidget);
    expect(find.text('BMI Calculator'), findsOneWidget);
    expect(find.text('Calculate BMI'), findsOneWidget);
  });
}
