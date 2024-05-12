import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/controllers/onBoarding_cubit/onboarding_cubit.dart';
import 'package:tqnia_chat/controllers/onBoarding_cubit/onboarding_states.dart';
import 'package:tqnia_chat/core/utils/app_colors.dart';
import 'package:tqnia_chat/core/utils/styles.dart';
import 'package:tqnia_chat/views/widgets/splash_screen_widgets/build_onboard_inicator_and_button.dart';
import 'package:tqnia_chat/views/widgets/splash_screen_widgets/build_onboarding_item.dart';
import 'package:tqnia_chat/views/widgets/splash_screen_widgets/build_page_view.dart';
import 'package:tqnia_chat/views/widgets/text_widget.dart';

import '../../constants.dart';
import '../widgets/splash_screen_widgets/build_onboarding_header.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: SafeArea(
        child: Scaffold(
          body: Center(
              child: Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 60.h),
            height: 670.h,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const BuildOnBoardingHeader(),
                SizedBox(
                  height: 60.h,
                ),
                const BuildPageView(),
                SizedBox(
                  height: 60.h,
                ),
                const BuildOnBoardInicatorAndButton(),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
