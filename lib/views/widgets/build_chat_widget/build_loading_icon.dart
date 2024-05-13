import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/controllers/chat_cubit/chat_cubit.dart';
import 'package:tqnia_chat/controllers/chat_cubit/chat_states.dart';
import 'package:tqnia_chat/core/utils/app_strings.dart';
import 'package:tqnia_chat/views/widgets/image_widgets.dart';

class BuildLoadingIcon extends StatelessWidget {
  const BuildLoadingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatStates>(
      builder: (context, state) {
        return state is SentMessageLoadingState
            ? Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 20.w),
                  child: FittedImage(
                      width: 61.w, height: 43.h, path: AppStrings.loadingIcon),
                ),
              )
            : const SizedBox();
      },
    );
  }
}
