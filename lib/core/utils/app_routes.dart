import 'package:flutter/material.dart';
import 'package:learn_managment1/feature/Auth/forget_password_screen.dart';
import 'package:learn_managment1/feature/Auth/login_screen.dart';
import 'package:learn_managment1/feature/Auth/new_password_screen.dart';
import 'package:learn_managment1/feature/ecommerce/e-commerce_screen.dart';
import 'package:learn_managment1/feature/Auth/otp_screen.dart';
import 'package:learn_managment1/feature/splash/splash_screen.dart';
import 'package:learn_managment1/feature/teacher/teacher_details.dart';

import '../../feature/ecommerce/cart_screen.dart';
import '../../feature/ecommerce/deatils_screen.dart';
import '../../feature/ecommerce/payment_screen.dart';
import '../../feature/teacher/teacher.dart';
import '../model/product_model.dart';
import '../model/teacher_model.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String forget = '/forget_password';
  static const String otp = '/otp_screen';
  static const String newPassword = '/new_password';
  static const String ecommerce = '/ecommerce';
  static const String details = '/details';
  static const String cart = '/cart';
  static const String payment = '/payment';
  static const String teacher = '/teacher';
  static const String teacherDetails = '/teacher_details';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case forget:
        return MaterialPageRoute(builder: (_) => ForgetPassword());

      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case teacher:
        return MaterialPageRoute(builder: (_) => const Teacher());

      case otp:
        return MaterialPageRoute(builder: (_) => const OtpScreen());

      case teacherDetails:
        final model = settings.arguments as TeacherModel;
        return MaterialPageRoute(
          builder: (_) => TeacherDetails(teacher: model),
        );

      case newPassword:
        return MaterialPageRoute(builder: (_) => const NewPasswordScreen());

      case ecommerce:
        return MaterialPageRoute(builder: (_) => const EcommerceScreen());

      case details:
        final args = settings.arguments as Map<String, dynamic>;
        final product = args['product'] as ProductModel;
        final cartItems = args['cartItems'] as List<Map<String, dynamic>>;
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(product: product, cartItems: cartItems),
        );

      case cart:
        final cartItems = settings.arguments as List<Map<String, dynamic>>;
        return MaterialPageRoute(
          builder: (_) => CartScreen(cartItems: cartItems),
        );

      case payment:
        final cartItems = settings.arguments as List<Map<String, dynamic>>;
        return MaterialPageRoute(
          builder: (_) => PaymentScreen(cartItems: cartItems),
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
