import 'package:flutter/material.dart';

import '../../models/message_model.dart';
import '../../views/routes/routes.dart';

extension OnContext on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  void goToHome() => Navigator.pushNamed(this, AppRoutes.home);
  void goToChat({required List<MessageModel> messages}) => Navigator.pushNamed(this, AppRoutes.chat,arguments:messages);
  void goAndReplaceToHome() =>
      Navigator.pushReplacementNamed(this, AppRoutes.home);
  void goAndReplaceToOnBoarding() =>
      Navigator.pushReplacementNamed(this, AppRoutes.onBoarding);
}