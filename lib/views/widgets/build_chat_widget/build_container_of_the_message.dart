import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/core/utils/app_colors.dart';
import 'package:tqnia_chat/core/utils/styles.dart';

class BuildContainerOfTheMessage extends StatelessWidget {
  final bool isQuestion;
  final String message;
  const BuildContainerOfTheMessage(
      {super.key, required this.isQuestion, required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Align(
        alignment: isQuestion ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          // alignment: isQuestion ? Alignment.centerRight : Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          constraints: BoxConstraints(maxWidth:isQuestion ? 267.w : 295.w),
          decoration: BoxDecoration(
            color: isQuestion
                ? AppColor.secondaryColor
                : AppColor.onBoardingItemColor,
            borderRadius: isQuestion
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )
                : const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
          ),
          child: Text(
            message,
            style: Styles.textStyleSize16Weight600,
            softWrap: true,
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
