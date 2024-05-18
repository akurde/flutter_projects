import 'package:expense_app/presentation/screens/home/home_page.dart';
import 'package:expense_app/presentation/screens/on_board/login_page.dart';
import 'package:expense_app/presentation/screens/on_board/sign_up_page.dart';
import 'package:expense_app/presentation/screens/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class AppRoutes {
  static const String SPLASH_PAGE = "/";
  static const String WELCOME_PAGE = "/welcome";
  static const String LOGIN_PAGE = "/login";
  static const String SIGNUP_PAGE = "/signUp";
  static const String VERIFICATION_PAGE = "/verification";
  static const String PASSWORDRECOVERY_PAGE = "/passwordRecovery";
  static const String HOME_PAGE = "/home";

  static Map<String, Widget Function(BuildContext)> routesMap() => {
    AppRoutes.SPLASH_PAGE:(context) => SplashPage(),
    AppRoutes.LOGIN_PAGE:(context) => LoginPage(),
    AppRoutes.SIGNUP_PAGE:(context) => SignUpPage(),
    //AppRoutes.WELCOME_PAGE:(context) => WelcomePage(),
    //AppRoutes.VERIFICATION_PAGE
    //AppRoutes.PASSWORDRECOVERY_PAGE
    AppRoutes.HOME_PAGE:(context) => HomePage()
  };
}