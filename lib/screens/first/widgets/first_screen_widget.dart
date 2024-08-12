import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:km_flutter_suitmedia/provider/provider.dart';
import 'package:provider/provider.dart';

import '../../second/second_screen.dart';
import '../../third/third_screen.dart';

Widget buttonAddPerson() {
  return Container(
      child: Container(
    width: 150.w,
    height: 150.h,
    child: Image.asset("assets/images/photo.png"),
  ));
}
Widget buildTextField(BuildContext context, String hintText, bool isName) {
  return Container(
    width: 200.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Center(
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.w),
          hintText: hintText,
          border: InputBorder.none,
        ),
        onChanged: (value) {
          final model = Provider.of<PalindromeModel>(context, listen: false);
          if (isName) {
            model.name = value;
          } else {
            model.sentence = value;
          }
        },
      ),
    ),
  );
}


Widget buildButton(BuildContext context, String buttonName) {
  return Container(
    width: 200.w,
    height: 50.h,
    child: ElevatedButton(
      onPressed: () {
        if (buttonName == 'CHECK') {
          final isPalindrome =
              Provider.of<PalindromeModel>(context, listen: false).isPalindrome(
            Provider.of<PalindromeModel>(context, listen: false).sentence,
          );
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(isPalindrome ? 'isPalindrome' : 'not palindrome'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        } else if (buttonName == 'NEXT') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondScreen()),
          );

        } else if (buttonName == 'Choose a User') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ThirdScreen()),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(43, 99, 123, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.w),
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
