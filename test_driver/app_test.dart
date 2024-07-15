// import 'package:flutter/material.dart';
// import 'package:flutter_crud/pages/employee.dart';
// import 'package:flutter_driver/flutter_driver.dart';
// import 'package:test/test.dart';

// void main() {
//   group(Employee, () {
//     FlutterDriver? driver;

//     setUpAll(() async {
//       driver = await FlutterDriver.connect();
//     });

//     tearDownAll(() {
//       if (driver != null) {
//         driver!.close();
//       }
//     });

//     // var textField = find.byType("TextField");
//     // debugPrint("we are here:" + textField.toString());

//   });

// }

import 'package:flutter/material.dart';
import 'package:flutter_crud/pages/employee.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group(Employee, () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      print('driver connected');
    });

    tearDownAll(() {
      if (driver != null) {
        driver!.close();
        print('driver closed');
      }
      print("driver closing");
      Timeout:
      Timeout(Duration(minutes: 1));
    });

    var textField = find.byType("TextField");
    var button = find.text("Add");
    var add = find.text("Name");
    test("Add the employee", () async {
      await driver?.tap(textField);
      await Future.delayed(Duration(seconds: 3));
      await driver?.enterText("Name");
      await Future.delayed(Duration(seconds: 3));
      await driver?.waitForAbsent(add);
      await driver?.enterText("Age");
      await driver?.enterText("Location");
      await driver?.tap(button);
      await Future.delayed(Duration(seconds: 3));
      await driver?.waitFor(add);
      await driver?.waitUntilNoTransientCallbacks();
      assert(add != null);
    });
    debugPrint("we are here:" + textField.toString());
  });
}
