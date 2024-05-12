// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class OnBoardingStates {}

class InitOnBoardingState extends OnBoardingStates {}

class OnPageChangedState extends OnBoardingStates {
  final int index;
  OnPageChangedState({
    required this.index,
  });
}
