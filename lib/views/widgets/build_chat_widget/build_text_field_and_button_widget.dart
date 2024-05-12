import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/controllers/chat_cubit/chat_cubit.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/styles.dart';
import '../image_widgets.dart';

class BuildTextFieldAndButtonWidget extends StatelessWidget {
  const BuildTextFieldAndButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ChatCubit cubit = BlocProvider.of(context);
    return Container(
      margin: EdgeInsets.only(top: 44.h, bottom: 61.h, left: 20.w, right: 20.w),
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
      ),
      height: 52.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.onBoardingItemColor,
        border: Border.all(width: 1.h, color: AppColor.whiteColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        key: cubit.formKey,
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              controller: cubit.textController,
              keyboardType: TextInputType.text,
              focusNode: cubit.focusNode,
              cursorColor: AppColor.whiteColor,
              textAlign: TextAlign.left,
              style: Styles.textStyleSize16Weight600,
              textDirection: TextDirection.ltr,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              textInputAction: TextInputAction.done,
            )),
            SizedBox(
              width: 8.w,
            ),
            InkWell(
                onTap: () => cubit.setQuestionMessage(),
                child: FittedImage(
                    height: 36.h, width: 36.w, path: AppStrings.sendButton)),
          ],
        ),
      ),
    );
  }
}
