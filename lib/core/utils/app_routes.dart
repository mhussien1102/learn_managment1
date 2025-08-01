import 'package:flutter/material.dart';
import 'package:learn_managment1/feature/Auth/login_screen.dart';

import '../../feature/splash/splash_screen.dart';
// import other screens as needed

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  // Add more route names here

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      // case home:
      //   return MaterialPageRoute(builder: (_) => const HomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('No route found'))),
        );
    }
  }
}
