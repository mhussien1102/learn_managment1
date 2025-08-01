import 'package:flutter/material.dart';
import 'package:learn_managment1/feature/Auth/forget_password.dart';
import 'package:learn_managment1/feature/Auth/login_screen.dart';

import '../../feature/Auth/otp_screen.dart';
import '../../feature/splash/splash_screen.dart';
// import other screens as needed

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String forget = '/forget_password';
  static const String otp = '/otp_screen';

  // Add more route names here

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case forget:
        return MaterialPageRoute(builder: (_) => ForgetPassword());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case otp:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('No route found'))),
        );
    }
  }
}
