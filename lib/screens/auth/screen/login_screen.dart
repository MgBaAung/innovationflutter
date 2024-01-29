import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovation/dimensions/dimension_manager.dart';
import 'package:innovation/screens/auth/network/auth_controller.dart';
import 'package:innovation/screens/auth/screen/term_condition_widget.dart';
import 'package:innovation/theme/app_color.dart';
import 'package:innovation/utils/constants/image_constant.dart';
import 'package:innovation/utils/text_fields/custom_textfield.dart';
import 'package:innovation/utils/text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authController = Get.find<AuthController>();
  bool checkValue = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => primaryFocus!.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.white,
        body: GetBuilder<AuthController>(builder: (controller) {
          return Form(
            key: controller.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: DM.screenHeight * 0.3,
                  child: Image.asset(
                    ImgConst.logo,
                    fit: BoxFit.cover,
                  ),
                ),
                CustomTextFormField(
                  prefixIcon: Icons.phone,
                  hint: 'Username (or) Phone number/Email',
                  controller: controller.usernameController,
                  validator: (value) => controller.validateText(value, "Name"),
                ),
                CustomTextFormField(
                  prefixIcon: Icons.star,
                  hint: 'Password',
                  controller: controller.passwordTextController,
                  validator: (value) => controller.validatePassword(value),
                ),
                TermsConditionWidget(
                  name: "Terms&Conditions",
                  value: checkValue,
                  onChange: (value) {
                    setState(() {
                      checkValue = !checkValue;
                    });
                  },
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  height: DM.screenHeight * 0.06,
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      if (controller.loginFormKey.currentState!.validate()) {
                        authController.login();
                      }
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        side: BorderSide.none),
                    child: Obx(
                      () => (controller.isLoginLoading.isTrue)
                          ? const CupertinoActivityIndicator(
                              color: AppColor.white)
                          : Text(
                              "Login",
                              style: mainBody.copyWith(color: AppColor.white),
                            ),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
