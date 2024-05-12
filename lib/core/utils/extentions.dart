import 'package:flutter/material.dart';

import '../../views/routes/routes.dart';

extension OnContext on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  void goToHome() => Navigator.pushNamed(this, AppRoutes.home);
  void goToChat() => Navigator.pushNamed(this, AppRoutes.chat);
  void goAndReplaceToHome() =>
      Navigator.pushReplacementNamed(this, AppRoutes.home);
  void goAndReplaceToOnBoarding() =>
      Navigator.pushReplacementNamed(this, AppRoutes.onBoarding);
}