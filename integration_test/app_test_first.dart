import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/firebase_options.dart';
import 'package:flutter_crud/main.dart' as app;
import 'package:flutter_crud/pages/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_crud/pages/employee.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'add to employee',
    () {
      testWidgets(
        "add the employee details",
        (tester) async {
          app.main();
          await Future.delayed(const Duration(seconds: 5));
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 5));
          // await tester.tap(find.ListView)

          // await tester.pumpWidget(allEmployeeDetails);
          //await Future.delayed(const Duration(seconds:30));
          await tester.tap(find.byType(FloatingActionButton));
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 3));
          //await Future.delayed(const Duration(seconds:30));

          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 4));
          await tester.enterText(find.byType(TextFormField).at(0), 'Amara');
          await Future.delayed(const Duration(seconds: 2));
          await tester.pumpAndSettle();
          await tester.enterText(find.byType(TextFormField).at(1), '24');
          await Future.delayed(const Duration(seconds: 2));
          await tester.pumpAndSettle();
          await tester.enterText(find.byType(TextFormField).at(2), 'Japan');
          await Future.delayed(const Duration(seconds: 3));
          await tester.pumpAndSettle();
          await tester.tap(find.byType(ElevatedButton));
          await Future.delayed(const Duration(seconds: 3));
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 3));
          expect(find.byType(Home), findsOneWidget);
        },
      );
    },
  );
}
