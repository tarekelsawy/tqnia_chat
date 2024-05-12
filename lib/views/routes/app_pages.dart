import 'package:flutter/material.dart';
import 'package:tqnia_chat/views/routes/routes.dart';
import 'package:tqnia_chat/views/screens/chat_screen.dart';
import 'package:tqnia_chat/views/screens/home_screen.dart';
import 'package:tqnia_chat/views/screens/onboarding_screen.dart';

import '../../core/utils/app_strings.dart';
import '../screens/spalsh_screen.dart';

class AppPages {
  static Route<dynamic>? onGenerateRoute(RouteSettings rs) {
    switch (rs.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case AppRoutes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case AppRoutes.chat:
        return MaterialPageRoute(builder: (context) => const ChatScreen());
    }
    return undefinedRoute();
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
