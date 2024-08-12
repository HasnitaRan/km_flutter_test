import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:km_flutter_suitmedia/screens/first/widgets/first_screen_widget.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 2000.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buttonAddPerson(),
            SizedBox(height: 50.h),
            buildTextField(context, "Name", true),
            SizedBox(
              height: 15.h,
            ),
            buildTextField(context, "Palindrome", false),
            SizedBox(height: 25.h),
            buildButton(context, "CHECK"),
            SizedBox(
              height: 15.h,
            ),
            buildButton(context, "NEXT"),
          ],
        ),
      ),
    );
  }
}
