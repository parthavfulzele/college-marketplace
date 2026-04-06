import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:college_marketplace/main.dart';

void main() {
  testWidgets('App renders login screen smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(const CollegeMarketplaceApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
