import 'package:crud_app/app/data/providers/employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

class EmployeeController extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtAge = TextEditingController();
  TextEditingController txtLocation = TextEditingController();

  void clearField() {
    txtName.clear();
    txtAge.clear();
    txtLocation.clear();
  }

  void postEmployeeData() async {
    String id = randomAlphaNumeric(10);

    Map<String, dynamic> data = {
      'id': id,
      'name': txtName.text,
      'age': txtAge.text,
      'location': txtLocation.text,
    };

    await EmployeeProvider().postEmployee(data, id).then((value) {
      clearField();
      Fluttertoast.showToast(
          msg: "Employee detail has been uploaded successfully.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF40A578),
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }
}
