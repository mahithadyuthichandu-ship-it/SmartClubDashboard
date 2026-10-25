import 'package:flutter_test/flutter_test.dart';
import 'package:smart_club_dashboard/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartClubApp());
    expect(find.textContaining('Smart Club'), findsOneWidget);
  });
}
