import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/models/onboarding_model.dart';

import 'build_onboard_text_item.dart';
import 'build_onboarding_icon_and_title.dart';

class BuildOnBoardingItem extends StatelessWidget {
  final OnboardingModel model;
  const BuildOnBoardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 313.h,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BuildOnboardingIconAndTitle(icon: model.icon, title: model.title),
          SizedBox(
            height: 40.h,
          ),
          BuildOnboardTextItem(statements: model.statements)
        ],
      ),
    );
  }
}
