import 'package:flutter/material.dart';

import '../common/colors.dart';

class secondScreen extends StatefulWidget {
  const secondScreen({super.key});

  @override
  State<secondScreen> createState() => _secondScreenState();
}

class _secondScreenState extends State<secondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.colorWhite),
        title: Text(
          "Welcome",
          style: TextStyle(
            color: AppColor.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColor.colorred,
      ),
    );
  }
}
