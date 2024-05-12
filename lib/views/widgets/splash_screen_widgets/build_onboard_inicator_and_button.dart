import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/core/utils/extentions.dart';

import '../../../constants.dart';
import '../../../controllers/onBoarding_cubit/onboarding_cubit.dart';
import '../../../controllers/onBoarding_cubit/onboarding_states.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/styles.dart';
import '../text_widget.dart';

class BuildOnBoardInicatorAndButton extends StatelessWidget {
  const BuildOnBoardInicatorAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingCubit cubit = context.read<OnBoardingCubit>();
    return SizedBox(
      height: 70.h,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 108.w,
            height: 2.h,
            child: Row(
              children: pages.asMap().entries.map((e) {
                return BlocBuilder<OnBoardingCubit, OnBoardingStates>(
                    builder: (context, state) {
                  return Container(
                    margin: e.key == pages.length - 1
                        ? null
                        : EdgeInsetsDirectional.only(end: 12.w),
                    width: 28.w,
                    color: cubit.currentIndex == e.key
                        ? AppColor.secondaryColor
                        : AppColor.onBoardingItemColor,
                  );
                });
              }).toList(),
            ),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () => cubit.nextpage(context),
              child: Container(
                height: 48.h,
                width: double.infinity,
                padding:
                    EdgeInsets.symmetric(vertical: 13.5.h, horizontal: 120.w),
                decoration: BoxDecoration(
                    color: AppColor.secondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: BlocBuilder<OnBoardingCubit, OnBoardingStates>(
                    builder: (context, state) {
                  return TextWidget(
                    text: cubit.currentIndex == pages.length - 1
                        ? 'Let’s Chat'
                        : 'Next',
                    style: Styles.textStyleSize18Weight700,
                    fit: BoxFit.fitHeight,
                  );
                }),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
