import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:km_flutter_suitmedia/screens/first/widgets/first_screen_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../third/third_screen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PalindromeModel>(context);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.blue,
          ),
          title: Center(
            child: Text(
              "Second Screen",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: TextStyle(fontSize: 10.sp),
              ),
              SizedBox(height: 20.h),
              Text(
                ' ${model.name}',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 150.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Selected User Name: ${model.selectedUserName ?? 'None'}',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 150.h),
                  Container(
                    width: 400.w,
                    child: buildButton(context, "Choose a User"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
