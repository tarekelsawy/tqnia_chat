import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/core/utils/theme.dart';
import 'package:tqnia_chat/views/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: false,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: darkTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppPages.onGenerateRoute,
        );
      },
    );
  }
}
