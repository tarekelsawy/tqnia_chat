import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../../../controllers/onBoarding_cubit/onboarding_cubit.dart';
import 'build_onboarding_item.dart';

class BuildPageView extends StatelessWidget {
  const BuildPageView({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingCubit cubit = context.read<OnBoardingCubit>();
    return SizedBox(
      height: 313.h,
      child: PageView(
        controller: cubit.pageController,
        onPageChanged: (index)=>cubit.onPageChanged(index),
        children: pages
            .asMap()
            .entries
            .map((e) => BuildOnBoardingItem(model: e.value))
            .toList(),
      ),
    );
  }
}
