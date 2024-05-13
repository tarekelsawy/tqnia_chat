import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/controllers/home_cubit/home_cubit.dart';
import 'package:tqnia_chat/core/utils/app_colors.dart';
import 'package:tqnia_chat/views/widgets/home_widgets/build_history.dart';
import 'package:tqnia_chat/views/widgets/home_widgets/build_new_chat_item.dart';

import '../widgets/home_widgets/build_home_footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.homeScreenColor,
          body: Container(
            margin: EdgeInsets.only(bottom: 23.h, top: 40.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      const BuildNewChatItem(),
                      SizedBox(
                        height: 12.h,
                      ),
                      const BuildHistory(),
                    ],
                  )),
                  const BuildHomeFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
