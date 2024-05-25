import 'package:crud_app/app/data/providers/employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtAge = TextEditingController();
  TextEditingController txtLocation = TextEditingController();
  var employeeStream = Stream.empty().obs;

  void clearField() {
    txtName.clear();
    txtAge.clear();
    txtLocation.clear();
  }

  void getAllEmployee() async {
    employeeStream.value = await EmployeeProvider().getAllEmployee();
  }

  void updateEmployee(String id) async {
    Map<String, dynamic> data = {
      'name': txtName.text,
      'age': txtAge.text,
      'location': txtLocation.text,
    };

    await EmployeeProvider().updateEmployee(data, id).then((value) {
      clearField();
      Get.back();
      Fluttertoast.showToast(
          msg: "Employee detail has been updated successfully.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF40A578),
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  void deleteEmployee(String id) async {
    await EmployeeProvider().deleteEmploye(id).then((value) {
      Get.back();
      Fluttertoast.showToast(
          msg: "Employee detail has been deleted successfully.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF40A578),
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  @override
  void onInit() {
    getAllEmployee();
    super.onInit();
  }
}
