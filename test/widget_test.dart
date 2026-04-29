import 'package:flutter_test/flutter_test.dart';
import 'package:grocery3/main.dart';

void main() {
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery3/main.dart';

void main() {
  testWidgets('GroceryApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that home view is displayed.
    expect(find.byType(MyApp), findsOneWidget);
  });
}
