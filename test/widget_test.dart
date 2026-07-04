// Basic smoke test for CyberPulse Academy.
//
// This replaces the original Flutter template's counter test (which
// referenced a "MyApp" class that never existed in this project) with a
// check that the app actually boots and shows its splash screen.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cyberpulse_academy/main.dart';

void main() {
  testWidgets('App boots and shows the splash screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CyberPulseApp());

    // The splash screen should show the app name and the entry button.
    expect(find.text('CyberPulse'), findsOneWidget);
    expect(find.text('ACADEMY'), findsOneWidget);
    expect(find.text('Start Learning'), findsOneWidget);
    expect(find.byIcon(Icons.shield), findsOneWidget);
  });
}
