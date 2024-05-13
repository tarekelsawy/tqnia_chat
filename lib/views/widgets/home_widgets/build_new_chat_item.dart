import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/core/utils/extentions.dart';
import 'package:tqnia_chat/models/message_model.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/styles.dart';
import '../image_widgets.dart';
import '../text_widget.dart';

class BuildNewChatItem extends StatelessWidget {
  const BuildNewChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goToChat(messages:<MessageModel>[] );
      },
      child: Container(
        height: 52.h,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 2.h, color: AppColor.onBoardingItemColor))),
        child: Row(
          children: [
            FittedImage(
                height: 20.h, width: 20.w, path: AppStrings.messageIcon),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
                child: Align(
              alignment: Alignment.centerLeft,
              child: TextWidgetWithoutFit(
                  text: 'New Chat', style: Styles.textStyleSize16Weight700),
            )),
            FittedImage(
                height: 12.h, width: 6.75.w, path: AppStrings.rightArrowIcon)
          ],
        ),
      ),
    );
  }
}
