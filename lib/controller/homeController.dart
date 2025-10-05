import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../common/colors.dart';

class HomeController extends GetxController{
  // Controllers for text fields
  RxBool passwordHide = false.obs;
  final  nameController = TextEditingController();
  final  passwordController = TextEditingController();

  // Save data to Firebase
  Future<bool> saveStudentData() async {
    String name = nameController.text.trim();
    String password = passwordController.text.trim();
    if (name.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all fields",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.colorred,
        colorText: AppColor.colorWhite,
      );
      return false;
    }
    await FirebaseFirestore.instance.collection('students').add({
      'name': nameController.text.trim(),
      'password': passwordController.text.trim(),
      'createdAt': DateTime.now(),
    });
    print("Data saved to Firebase");
    nameController.clear();
    passwordController.clear();
    return true;
  }
  

}