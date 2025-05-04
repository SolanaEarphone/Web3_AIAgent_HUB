import 'package:flutter/material.dart';

import '../../config/app_config.dart';
import '../../features/auth/presentation/pages/signin_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/home/presentation/pages/main_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConfig.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case AppConfig.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case AppConfig.homeRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))));
    }
  }
}
