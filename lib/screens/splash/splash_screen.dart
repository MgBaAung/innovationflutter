import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovation/dimensions/dimension_manager.dart';
import 'package:innovation/theme/app_color.dart';
import 'package:innovation/utils/constants/image_constant.dart';

import 'splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final controller = Get.find<SplashController>();

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: DM.screenWidth,
        height: DM.screenHeight,
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildImage(context),
              SizedBox(
                width: DM.screenWidth * 0.55,
                child: LinearProgressIndicator(
                  value: _animation.value,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(20),
                  backgroundColor: AppColor.secondaryWhite,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColor.secondaryColorLight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: DM.screenHeight * 0.5,
          child: Image.asset(
            ImgConst.logo,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
