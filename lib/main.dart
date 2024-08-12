import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:km_flutter_suitmedia/screens/first/first_screen.dart';
import 'package:provider/provider.dart';

import 'provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PalindromeModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        title: '',
        home: FirstScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
