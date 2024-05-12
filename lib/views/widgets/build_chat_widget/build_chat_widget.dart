import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/controllers/chat_cubit/chat_cubit.dart';
import 'package:tqnia_chat/controllers/chat_cubit/chat_states.dart';
import 'package:tqnia_chat/views/widgets/build_chat_widget/build_container_of_the_message.dart';

import '../../../core/utils/styles.dart';
import '../text_widget.dart';

class BuildChatWidget extends StatelessWidget {
  const BuildChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ChatCubit cubit = BlocProvider.of(context, listen: false);
    return Container(
      width: double.infinity,
      height: 575.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: BlocBuilder<ChatCubit, ChatStates>(builder: (context, state) {
        return cubit.messages.isEmpty
            ? const BuildEmptyChat()
            : const BuildChat();
      }),
    );
  }
}

class BuildChat extends StatelessWidget {
  const BuildChat({super.key});

  @override
  Widget build(BuildContext context) {
    ChatCubit cubit = BlocProvider.of(context, listen: false);
    return BlocBuilder<ChatCubit, ChatStates>(
        buildWhen: (previous, current) => current is SetQuestionMessageState,
        builder: (context, states) {
          return ListView.separated(
            reverse: true,
            itemCount: cubit.messages.length,
            itemBuilder: (context, index) {
              return BuildContainerOfTheMessage(
                  isQuestion: cubit.messages[index].isQuestion,
                  message: cubit.messages[index].message);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 32.h);
            },
          );
        });
  }
}

class BuildEmptyChat extends StatelessWidget {
  const BuildEmptyChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextWidget(
          text: 'Ask anything, get your answer',
          style: Styles.textStyleSize16Weight600),
    );
  }
}
