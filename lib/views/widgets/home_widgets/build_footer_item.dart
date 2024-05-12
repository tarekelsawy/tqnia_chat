// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/core/utils/app_colors.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/styles.dart';
import '../image_widgets.dart';
import '../text_widget.dart';

class BuildFooterItem extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final String icon;
  const BuildFooterItem({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            FittedImage(height: 20.h, width: 20.w, path: icon),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextWidgetWithoutFit(
                        text: text,
                        style: Styles.textStyleSize16Weight500.copyWith(
                            color: text == 'Logout'
                                ? AppColor.logOutColorForTextColor
                                : AppColor.whiteColor)),
                  ),
                ),
                if (text == 'Upgrade to Plus')
                  Container(
                    height: 20.h,
                    width: 46.w,
                    decoration: BoxDecoration(
                      color: AppColor.plusFeatureContainerColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextWidgetWithoutFit(
                        text: 'NEW',
                        style: Styles.textStyleSize12Weight600
                            .copyWith(color: AppColor.plusFeatureTextColor)),
                  )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
