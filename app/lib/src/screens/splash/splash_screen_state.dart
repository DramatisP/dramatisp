part of 'splash_screen.dart';

@immutable
abstract class SplashScreenState {}

class Initial extends SplashScreenState {}

class Loading extends SplashScreenState {}

class Loaded extends SplashScreenState {}