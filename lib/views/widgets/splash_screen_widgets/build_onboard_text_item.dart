import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/styles.dart';
import '../text_widget.dart';

class BuildOnboardTextItem extends StatelessWidget {
  final List<String> statements;
  const BuildOnboardTextItem({super.key, required this.statements});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 218.h,
      width: double.infinity,
      child: Column(
        children: statements.asMap().entries.map((e) {
          return Container(
            margin: e.key == statements.length - 1
                ? null
                : EdgeInsets.only(bottom: 16.h),
            padding: EdgeInsets.symmetric(horizontal: 37.5.w, vertical: 6.h),
            decoration: BoxDecoration(
                color: AppColor.onBoardingItemColor,
                borderRadius: BorderRadius.circular(10)),
            height: 62.h,
            width: double.infinity,
            child: TextWidget(
              text: statements[e.key],
              style: Styles.textStyleSize16Weight500,
              fit: BoxFit.fitHeight,
              maxLines: 2,
            
            ),
          );
        }).toList(),
      ),
    );
  }
}
