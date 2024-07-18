import 'package:flutter/material.dart';
import 'package:flutter_crud/service/database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
import 'package:flutter_regex/flutter_regex.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void _add() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(formKey.currentContext!).showSnackBar(
          const SnackBar(content: Text('Add Employee Successfully')));
    }
  }

  String? _validateName(value) {
    if (value!.isEmpty) {
      return 'Please enter your Name';
    }
    RegExp nameRegExp = RegExp(r'^[a-z A-Z]+$');
    if (!nameRegExp.hasMatch(value)) {
      return 'Please enter a valid Name';
    }
    return null;
  }

  String? _validateAge(value) {
    if (value!.isEmpty) {
      return 'Please enter your Age';
    }
    RegExp ageRegExp = RegExp(r'^(1[89]|[2-9]\d|\d{3,})$');
    if (!ageRegExp.hasMatch(value)) {
      return 'Please enter a valid Age';
    }
    return null;
  }

  String? _validatelocation(value) {
    if (value!.isEmpty) {
      return 'Please enter your Location';
    }
    RegExp nameRegExp = RegExp(r'^[a-z A-Z]+$');
    if (!nameRegExp.hasMatch(value)) {
      return 'Please enter your Location';
    }
    return null;
  }

  TextEditingController namecontroller = new TextEditingController();
  TextEditingController agecontroller = new TextEditingController();
  TextEditingController locationcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Employee",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Form",
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 70.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 40.0, top: 30.0, right: 40.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                        labelText: "Enter your Name", border: InputBorder.none),
                    validator: _validateName,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  "Age",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: agecontroller,
                    decoration: InputDecoration(
                        labelText: "Enter your Age", border: InputBorder.none),
                    validator: _validateAge,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Location",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: locationcontroller,
                    decoration: InputDecoration(
                        labelText: "Enter your Location",
                        border: InputBorder.none),
                    validator: _validatelocation,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          _add();
                          String Id = randomAlphaNumeric(10);
                          Map<String, dynamic> employeeInfoMap = {
                            "Name": namecontroller.text,
                            "Age": agecontroller.text,
                            "Id": Id,
                            "Location": locationcontroller.text,
                          };
                          await DatabaseMethods()
                              .addEmployeeDetails(
                                employeeInfoMap,
                                Id,
                              )
                              .then((value) {});
                          Fluttertoast.showToast(
                              msg:
                                  "Employee details have been added successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        "ADD",
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
