import 'package:assignment/presentation/screens/food/food_cart_screen.dart';
import 'package:assignment/presentation/screens/food/food_checkout_address_screen.dart';
import 'package:assignment/presentation/screens/food/food_details_screen.dart';
import 'package:assignment/presentation/screens/food/food_login_screen.dart';
import 'package:assignment/presentation/screens/food/food_order_details_screen.dart';
import 'package:assignment/presentation/screens/food/food_order_success_screen.dart';
import 'package:assignment/presentation/screens/quiz/quiz_home_screen.dart';
import 'package:assignment/presentation/screens/quiz/quiz_questions_screen.dart';
import 'package:assignment/presentation/screens/quiz/quiz_results_screen.dart';
import 'package:flutter/material.dart';

import '../../core/exceptions/route_exception.dart';
import '../screens/food/food_home_screen.dart';
import '../screens/food/food_register_screen.dart';
import '../screens/home_screen.dart';
import '../screens/splash_screen.dart';

class AppRouter {
  static const String splash = '/', home = 'home';

  static const String quizHome = 'quizHome', quizQuestions = 'quizQuestions', quizResults = 'quizResults';

  static const String foodLogin = 'foodLogin', foodRegister = 'foodRegister', foodHome = 'foodHome',
      foodDetails = 'foodDetails', foodCart = 'foodCart', foodCheckoutAddress = 'foodCheckoutAddress',
      foodOrderComplete = 'foodOrderComplete', foodOrderDetails = 'foodOrderDetails';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case quizHome:
        return MaterialPageRoute(
          builder: (_) => const QuizHomeScreen(),
        );
      case quizQuestions:
        return MaterialPageRoute(
          builder: (_) => const QuizQuestionsScreen(),
        );
      case quizResults:
        return MaterialPageRoute(
          builder: (_) => const QuizResultsScreen(),
        );
      case foodLogin:
        return MaterialPageRoute(
          builder: (_) => const FoodLoginScreen(),
        );
      case foodRegister:
        return MaterialPageRoute(
          builder: (_) => const FoodRegisterScreen(),
        );
      case foodHome:
        return MaterialPageRoute(
          builder: (_) => const FoodHomeScreen(),
        );
      case foodDetails:
        return MaterialPageRoute(
          builder: (_) => const FoodDetailsScreen(),
        );
      case foodCart:
        return MaterialPageRoute(
          builder: (_) => const FoodCartScreen(),
        );
      case foodCheckoutAddress:
        return MaterialPageRoute(
          builder: (_) => const FoodCheckoutAddressScreen(),
        );
      case foodOrderComplete:
        return MaterialPageRoute(
          builder: (_) => const FoodOrderSuccessScreen(),
        );
      case foodOrderDetails:
        return MaterialPageRoute(
          builder: (_) => const FoodOrderDetailsScreen(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}