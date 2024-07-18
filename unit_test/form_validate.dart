import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_crud/pages/employee.dart';
import 'package:flutter_crud/main.dart' as app;
import 'package:integration_test/integration_test.dart';
// Replace with your actual file path

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Employee Form Validation', () {
    late Employee employeeWidget; // Replace with your actual Widget class name

    setUp(() {
      employeeWidget = Employee(); // Initialize your widget before each test
    });

    testWidgets('Empty Name validation', (WidgetTester tester) async {
      app.main();
      await Future.delayed(const Duration(seconds: 6));
      await tester.pumpWidget(MaterialApp(home: employeeWidget));

      final nameField = find.byKey(ValueKey('nameField'));

      await tester.enterText(nameField, '');
      await tester.pump();

      expect(find.text('Please enter your Name'), findsOneWidget);
    });

    testWidgets('Valid Name validation', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: employeeWidget));
      final nameField = find.byKey(ValueKey('nameField'));

      await tester.enterText(nameField, 'John Doe');
      await tester.pump();

      expect(find.text('Please enter a valid Name'), findsNothing);
    });

    // Similarly, write tests for Age and Location fields
    testWidgets('Empty Age validation', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: employeeWidget));
      final ageField = find.byKey(ValueKey('ageField'));

      await tester.enterText(ageField, '');
      await tester.pump();

      expect(find.text('Please enter your Age'), findsOneWidget);
    });

    testWidgets('Valid Age validation', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: employeeWidget));
      final ageField = find.byKey(ValueKey('ageField'));

      await tester.enterText(ageField, '30');
      await tester.pump();

      expect(find.text('Please enter a valid Age'), findsNothing);
    });

    testWidgets('Empty Location validation', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: employeeWidget));
      final locationField = find.byKey(ValueKey('locationField'));

      await tester.enterText(locationField, '');
      await tester.pump();

      expect(find.text('Please enter your Location'), findsOneWidget);
    });

    testWidgets('Valid Location validation', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: employeeWidget));
      final locationField = find.byKey(ValueKey('locationField'));

      await tester.enterText(locationField, 'New York');
      await tester.pump();

      expect(find.text('Please enter a valid Location'), findsNothing);
    });
  });
}
