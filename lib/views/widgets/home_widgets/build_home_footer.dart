import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/controllers/home_cubit/home_cubit.dart';
import 'package:tqnia_chat/core/utils/app_colors.dart';

import '../../../core/utils/app_strings.dart';
import 'build_footer_item.dart';

class BuildHomeFooter extends StatelessWidget {
  const BuildHomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      height: 315.h,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              top:
                  BorderSide(width: 2.h, color: AppColor.onBoardingItemColor))),
      child: Column(
        children: [
          BuildFooterItem(
              onTap: () =>cubit.clearChat(),
              text: 'Clear conversations',
              icon: AppStrings.deleteIcon),
          BuildFooterItem(
              onTap: () {}, text: 'Upgrade to Plus', icon: AppStrings.userIcon),
          BuildFooterItem(
              onTap: () {}, text: 'Light mode', icon: AppStrings.lightIcon),
          BuildFooterItem(
              onTap: () {}, text: 'Updates & FAQ', icon: AppStrings.faqIcon),
          BuildFooterItem(
              onTap: () =>cubit.logOut(context), text: 'Logout', icon: AppStrings.logOutIcon),
        ],
      ),
    );
  }
}
