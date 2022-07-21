// routes for the app
import 'package:app/src/screens/home/index.dart';
import 'package:app/src/screens/characters/index.dart';
import 'package:app/src/screens/onboarding/authentication_screen.dart';
import 'package:app/src/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case '/home':
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case '/auth':
      return MaterialPageRoute(builder: (_) => AuthenticationScreen());
    case '/characters':
      return MaterialPageRoute(builder: (_) => CharacterScreen());
    default:
      return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}
