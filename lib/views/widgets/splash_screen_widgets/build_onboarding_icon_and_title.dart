import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/views/widgets/image_widgets.dart';

import '../../../core/utils/styles.dart';
import '../text_widget.dart';

class BuildOnboardingIconAndTitle extends StatelessWidget {
  final String icon;
  final String title;
  const BuildOnboardingIconAndTitle(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      width: 104.w,
      child: Column(
        children: [
          FittedImage(width: 23.09.w, height: 20.h, path: icon),
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child:
                TextWidget(text: title, style: Styles.textStyleSize20Weight500),
          )),
        ],
      ),
    );
  }
}
