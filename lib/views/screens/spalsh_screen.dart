import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/core/utils/app_strings.dart';
import 'package:tqnia_chat/core/utils/extentions.dart';
import 'package:tqnia_chat/views/widgets/text_widget.dart';

import '../../core/utils/styles.dart';
import '../widgets/image_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      context.goAndReplaceToOnBoarding();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 195.h,
          width: 169.w,
          child: Column(
            children: [
              FittedImage(
                height: 108.h,
                width: 108.w,
                path: AppStrings.chatGPTIcon,
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: TextWidget(
                    text: 'ChatGPT', style: Styles.textStyleSize40Weight700),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
