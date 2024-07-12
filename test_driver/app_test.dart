import 'package:flutter/material.dart';
import 'package:flutter_crud/pages/employee.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group(Employee, () {
/*    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      if (driver != null) {
        driver!.close();
      }
    });
*/
    var textField = find.byType("TextField");
    debugPrint("we are here:" + textField.toString());
  });
}
