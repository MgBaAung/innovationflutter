import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovation/screens/auth/screen/login_screen.dart';
import 'package:innovation/screens/pick_up/pickup_screen.dart';
import 'package:innovation/screens/splash/splash_binding.dart';
import 'package:innovation/screens/splash/splash_screen.dart';
import '../routes/route_helper.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: RouteHelper.splash,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    smoothGetPage(name: RouteHelper.login, page: const LoginScreen()),
    
    GetPage(name: RouteHelper.pickupScreen, page: () => const PickupScreen()),
  ];
}

GetPage smoothGetPage(
    {required String name,
    required Widget page,
    Duration duration = const Duration(milliseconds: 500)}) {
  return GetPage(
    name: name,
    page: () => page,
    fullscreenDialog: true,
    transition: Transition.fadeIn,
    transitionDuration: duration,
  );
}
