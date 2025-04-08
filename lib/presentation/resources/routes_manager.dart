import 'package:course_clean_architecture_with_mvvm/presentation/forget_password/forget.dart';
import 'package:course_clean_architecture_with_mvvm/presentation/login/login.dart';
import 'package:course_clean_architecture_with_mvvm/presentation/main/main_view.dart';
import 'package:course_clean_architecture_with_mvvm/presentation/onboarding/onboarding.dart';
import 'package:course_clean_architecture_with_mvvm/presentation/register/register.dart';
import 'package:course_clean_architecture_with_mvvm/presentation/spash/spash.dart';
import 'package:course_clean_architecture_with_mvvm/presentation/store_details/store_details.dart';
import 'package:flutter/material.dart';
import 'strings_manager.dart';

class Routes {

  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails';
}


class RouteGenerator {

  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) =>const LoginView());
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) =>const OnBoardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) =>const RegisterView());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) =>const ForgetPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) =>const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) =>const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_) =>
        Scaffold(appBar: AppBar(title: const Text(AppStrings.noRouteFound)),
            body: const Center(child: Text(AppStrings.noRouteFound))));
  }
}

