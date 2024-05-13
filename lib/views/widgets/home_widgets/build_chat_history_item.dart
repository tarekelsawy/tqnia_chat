import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/controllers/home_cubit/home_cubit.dart';
import 'package:tqnia_chat/core/utils/extentions.dart';
import 'package:tqnia_chat/views/widgets/home_widgets/drop_down_button.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/styles.dart';
import '../image_widgets.dart';
import '../text_widget.dart';

class BuildChatHistoryItem extends StatelessWidget {
  final int index;
  const BuildChatHistoryItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();
    return Container(
      height: 52.h,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 2.h, color: AppColor.onBoardingItemColor))),
      child: Row(
        children: [
          InkWell(
            onTap: () => context.goToChat(messages: cubit.historyChats[index].messages),
            child: FittedImage(height: 20.h, width: 20.w, path: AppStrings.messageIcon)),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
              child: Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => context.goToChat(messages: cubit.historyChats[index].messages),
              child: TextWidgetWithoutFit(
                  text: cubit.historyChats[index].messages[0].message,
                  style: Styles.textStyleSize16Weight500),
            ),
          )),
          SizedBox(
            width: 4.w,
          ),
          InkWell(
              onTap: () => cubit.deleteChat(index),
              child: FittedImage(
                  width: 20.w, height: 20.h, path: AppStrings.deleteIcon)),
          SizedBox(
            width: 15.w,
          ),
          InkWell(
            onTap: () => context.goToChat(messages: cubit.historyChats[index].messages),
            child: FittedImage(
                height: 12.h, width: 6.75.w, path: AppStrings.rightArrowIcon),
          )
        ],
      ),
    );
  }
}
//  'Why is the sky blue ?'