import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_calculator_pro/main.dart';

void main() {
  testWidgets('App basic navigation test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    // Verify that the initial result '0' is present in the header.
    expect(find.text('0'), findsOneWidget);
  });
}
