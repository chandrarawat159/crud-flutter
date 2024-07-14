import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_crud/main.dart' as app;

void main() {
  Future.delayed(Duration(seconds: 3));
  enableFlutterDriverExtension();
  app.main();
}
