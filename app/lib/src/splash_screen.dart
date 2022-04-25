import 'package:app/src/config/color_constants.dart';
import 'package:app/src/config/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.secondaryAppColor,
      body: Center(child: Image.asset(AllImages().logo))
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((val) {
      Navigator.pushNamed(context, '/home');
    });
  }
}
