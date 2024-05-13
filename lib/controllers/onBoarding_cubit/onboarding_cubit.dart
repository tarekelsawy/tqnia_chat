import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tqnia_chat/controllers/onBoarding_cubit/onboarding_states.dart';
import 'package:tqnia_chat/core/utils/database_manager.dart';
import 'package:tqnia_chat/core/utils/extentions.dart';

import '../../constants.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  PageController pageController = PageController();
  int currentIndex = 0;
  OnBoardingCubit() : super(InitOnBoardingState());

  void nextpage(BuildContext context) {
    if (currentIndex == pages.length - 1) {
      DataBaseManager.setIsFirstVisit = false;
      context.goAndReplaceToHome();
    }
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  void onPageChanged(int index) {
    currentIndex = index;
    emit(OnPageChangedState(index: index));
  }
}
