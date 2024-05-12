import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/views/widgets/home_widgets/drop_down_button.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/styles.dart';
import '../image_widgets.dart';
import '../text_widget.dart';

class BuildChatHistoryItem extends StatelessWidget {
  const BuildChatHistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 2.h, color: AppColor.onBoardingItemColor))),
      child: Row(
        children: [
          FittedImage(height: 20.h, width: 20.w, path: AppStrings.messageIcon),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
              child: Align(
            alignment: Alignment.centerLeft,
            child: TextWidgetWithoutFit(
                text: 'Why is the sky blue ?',
                style: Styles.textStyleSize16Weight500),
          )),
          FittedImage(
              width: 2.67.w, height: 11.h, path: AppStrings.settingIcon),
          SizedBox(
            width: 20.w,
          ),
          FittedImage(
              height: 12.h, width: 6.75.w, path: AppStrings.rightArrowIcon)
        ],
      ),
    );
  }
}
