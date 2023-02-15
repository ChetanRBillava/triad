import 'package:assignment/presentation/screens/quiz/quiz_home_screen.dart';
import 'package:assignment/presentation/screens/quiz/quiz_questions_screen.dart';
import 'package:assignment/presentation/screens/quiz/quiz_results_screen.dart';
import 'package:flutter/material.dart';

import '../../core/exceptions/route_exception.dart';
import '../screens/home_screen.dart';
import '../screens/splash_screen.dart';

class AppRouter {
  static const String splash = '/', home = 'home';

  static const String quizHome = 'quizHome', quizQuestions = 'quizQuestions', quizResults = 'quizResults';

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
      default:
        throw const RouteException('Route not found!');
    }
  }
}