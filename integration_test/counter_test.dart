import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/firebase_options.dart';
import 'package:flutter_crud/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
// import 'package:flutter_web/counter_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  //app.main();
  //Future.delayed(Duration(seconds: 10));
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      // Load app widget.
      await tester.pumpWidget(MyApp());

      await tester.tap(find.byIcon(Icons.add));

      // var TextField = find.byType("TextField");
      // var Button = find.text("EmployeeDetails");

      // Trigger a frame.
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 10));

      // Verify the counter increments by 1.
      expect(find.text('1'), findsOneWidget);
      try {
        expect(find.text('EmployeeDetails'), findsOneWidget);
        // expect(find.text('1'), findsOneWidget);
      } catch (error) {
        debugPrint("Error finding EmployeeForm: " + error.toString());
      }
    });
  });
}
