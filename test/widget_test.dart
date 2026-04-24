import 'package:flutter_test/flutter_test.dart';
import 'package:grocery3/main.dart';

void main() {
  testWidgets('GroceryApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // Note: Since main() initializes some services, we might need to mock them if they fail in test environment.
    // However, for a simple smoke test, we just check if it builds.
    await tester.pumpWidget(const GroceryApp());

    expect(find.byType(GroceryApp), findsOneWidget);
  });
}
