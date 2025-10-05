
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/colors.dart';
import '../controller/homeController.dart';
import 'student_details.dart';


class firstscreen extends StatefulWidget {
  const firstscreen({super.key});

  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorred,
        title: Text(
          "Student Management",
          style: TextStyle(
            color: AppColor.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: homeController.nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, size: 30),
                  prefixIconColor: AppColor.colorred,
                  hintText: "Enter Your Name",
                  hintStyle: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hoverColor: AppColor.colorWhite,
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: homeController.passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.visibility_outlined, size: 30),
                  prefixIconColor: AppColor.colorred,
                  hintText: "Enter Your Password",

                  hintStyle: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hoverColor: AppColor.colorWhite,
                ),
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () async {
                  // Save to Firebase
                  bool success = await homeController.saveStudentData();
                  // Navigate using GetX
                  if (success) {
                    Get.to(() => const secondScreen());
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.colorred,
                    border: Border.all(color: AppColor.colorOrange, width: 1),
                  ),
                  child: Center(
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColor.colorWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}