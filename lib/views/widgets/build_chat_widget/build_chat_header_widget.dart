import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/core/utils/app_colors.dart';
import 'package:tqnia_chat/core/utils/extentions.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/styles.dart';
import '../image_widgets.dart';
import '../text_widget.dart';

class BuildChatHeaderWidget extends StatelessWidget {
  const BuildChatHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 44.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: double.infinity,
      height: 64.h,
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 2.h, color: AppColor.onBoardingItemColor))),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              context.goAndReplaceToHome();
            },
            child: FittedImage(
                width: 6.75.w, height: 12.h, path: AppStrings.leftArrowIcon),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
              child: Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => context.goAndReplaceToHome(),
              child: TextWidgetWithoutFit(
                  text: 'Back', style: Styles.textStyleSize16Weight600),
            ),
          )),
          FittedImage(height: 24.h, width: 24.w, path: AppStrings.chatGPTIcon),
        ],
      ),
    );
  }
}
