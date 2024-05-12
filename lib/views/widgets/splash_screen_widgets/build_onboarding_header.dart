import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/styles.dart';
import '../image_widgets.dart';
import '../text_widget.dart';

class BuildOnBoardingHeader extends StatelessWidget {
  const BuildOnBoardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 167.h,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: FittedImage(
                      height: 24.h,
                      width: 24.w,
                      path: AppStrings.chatGPTIcon))),
          Expanded(
              flex: 2,
              child: Center(
                  child: TextWidget(
                text: 'Welcome to\nChatGPT',
                style: Styles.textStyleSize32Weight700,
                maxLines: 2,
              ))),
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextWidget(
                      text: 'Ask anything, get yout answer',
                      style: Styles.textStyleSize16Weight600)))
        ],
      ),
    );
  }
}
