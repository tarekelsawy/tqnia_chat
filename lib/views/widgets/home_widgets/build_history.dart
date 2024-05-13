import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tqnia_chat/controllers/home_cubit/home_cubit.dart';
import 'package:tqnia_chat/controllers/home_cubit/home_states.dart';
import 'package:tqnia_chat/core/utils/app_colors.dart';
import 'package:tqnia_chat/core/utils/database_manager.dart';
import 'package:tqnia_chat/core/utils/styles.dart';
import 'package:tqnia_chat/models/message_model.dart';
import 'package:tqnia_chat/views/widgets/text_widget.dart';

import 'build_chat_history_item.dart';

class BuildHistory extends StatelessWidget {
  const BuildHistory({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          if (state is HistoryChatsLoadingState) {
            debugPrint('after state HistoryChatsLoadingState');
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.secondaryColor,
              ),
            );
          } else {
            debugPrint('after state HistoryChatsSuccesState');
            return cubit.historyChats.isNotEmpty
                ? ValueListenableBuilder(
                    valueListenable: DataBaseManager.chatsBox.listenable(),
                    builder: (context, Box box, child) {
                      cubit.historyChats = [];
                      for (int i = 0; i < box.length; ++i) {
                        cubit.historyChats.add(DataBaseManager.getChatAt(i));
                      }
                      return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: cubit.historyChats.length,
                          itemBuilder: (context, index) {
                            return BuildChatHistoryItem(
                              index: index,
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 12.h,
                              ));
                    })
                : Center(
                    child: TextWidget(
                        text: 'No History Chats',
                        style: Styles.textStyleSize18Weight700
                            .copyWith(color: AppColor.onBoardingItemColor)),
                  );
          } 
        },
      ),
    );
  }
}
