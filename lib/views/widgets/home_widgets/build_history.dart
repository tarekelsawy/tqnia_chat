import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'build_chat_history_item.dart';

class BuildHistory extends StatelessWidget {
  const BuildHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const BuildChatHistoryItem();
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 12.h,
                            )),
                  );
  }
}