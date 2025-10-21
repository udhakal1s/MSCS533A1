import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:converter_app/main.dart';

void main() {
  testWidgets('App builds without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const ConverterApp());

    // Check that the title is displayed
    expect(find.text('Converter App'), findsOneWidget);

    // Check that input field is present
    expect(find.byType(TextField), findsOneWidget);

    // Check that Convert button exists
    expect(find.text('Convert'), findsOneWidget);
  });
}

