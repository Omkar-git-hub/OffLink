import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';

void main() {
  testWidgets('OffLink home screen loads', (WidgetTester tester) async {
    await tester.pumpWidget(const OffLinkApp());

    expect(find.text('OffLink'), findsWidgets);
    expect(find.text('Offline communication'), findsOneWidget);
    expect(find.text('Connect'), findsOneWidget);
  });
}