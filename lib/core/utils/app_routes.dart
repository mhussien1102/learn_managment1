import 'package:flutter/material.dart';
import 'package:learn_managment1/feature/Auth/forget_password_screen.dart';
import 'package:learn_managment1/feature/Auth/login_screen.dart';
import 'package:learn_managment1/feature/Auth/new_password_screen.dart';
import 'package:learn_managment1/feature/ecommerce/e-commerce_screen.dart';
import 'package:learn_managment1/feature/Auth/otp_screen.dart';
import 'package:learn_managment1/feature/splash/splash_screen.dart';

import '../../feature/ecommerce/cart_screen.dart';
import '../../feature/ecommerce/deatils_screen.dart';
import '../model/product_model.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String forget = '/forget_password';
  static const String otp = '/otp_screen';
  static const String newPassword = '/new_password';
  static const String ecommerce = '/ecommerce';
  static const String details = '/details';
  static const String cart = '/cart';

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

      case newPassword:
        return MaterialPageRoute(builder: (_) => const NewPasswordScreen());

      case ecommerce:
        return MaterialPageRoute(builder: (_) => const EcommerceScreen());

      case details:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(product: product),
        );

      case cart:
        // ✅ Correctly receive cart items from arguments
        final cartItems = settings.arguments as List<Map<String, dynamic>>;
        return MaterialPageRoute(
          builder: (_) => CartScreen(cartItems: cartItems),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('No route found'))),
        );
    }
  }
}
