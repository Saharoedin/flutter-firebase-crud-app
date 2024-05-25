import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/employee_model.dart';

class EmployeeProvider extends GetConnect {
  Future<Stream<QuerySnapshot>> getAllEmployee() async {
    return await FirebaseFirestore.instance.collection('Employee').snapshots();
  }

  Future postEmployee(
    Map<String, dynamic> employee,
    String id,
  ) async {
    return await FirebaseFirestore.instance
        .collection('Employee')
        .doc(id)
        .set(employee);
  }

  Future updateEmployee(Map<String, dynamic> employee, String id) async {
    return await FirebaseFirestore.instance
        .collection('Employee')
        .doc(id)
        .update(employee);
  }

  Future deleteEmploye(String id) async {
    return await FirebaseFirestore.instance
        .collection('Employee')
        .doc(id)
        .delete();
  }
}
