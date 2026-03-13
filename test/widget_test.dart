import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_calculator_pro/main.dart';

void main() {
  testWidgets('Welcome screen basic test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: AiCalculatorApp(),
      ),
    );

    // Verify that our welcome text is present.
    expect(find.text('AI Calculator\nPro'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}
