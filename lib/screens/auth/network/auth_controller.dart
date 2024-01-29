import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:innovation/cache/app_storage.dart';
import 'package:innovation/routes/route_helper.dart';
import 'package:innovation/screens/auth/models/user_model.dart';
import 'package:innovation/screens/auth/network/auth_repository.dart';
import 'package:innovation/utils/constants/constants.dart';
import 'package:innovation/utils/snackbars/snackbar_content.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  final appStorage = AppStorage();

  //login
  final usernameController = TextEditingController();
  final passwordTextController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  String? validateText(String? text, String symbol) {
    if (text == null || text.isEmpty) return "$symbol can't be blank";
    return null;
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) return "Password can't be blank.";
    if (text.length < 6) return "Password must be more than 6 characters.";
    return null;
  }

  // // Login
  RxBool isLoginLoading = false.obs;

  Future<void> login() async {
   
    isLoginLoading(true);
    try {
      await authRepo.login(map: {
        "username": usernameController.text,
        "password": passwordTextController.text,
      }).then((response) async {
        if (response.statusCode == 200 && response.body["success"] == true) {
          final model = UserModelData.fromJson(response.body);
          xGetrefreshToken(token: model.data?.refreshToken??"");
          clearText();
          
        } else {
          isLoginLoading.value = false;
          debugPrint(
              "Login failed - ${response.statusCode} ${response.bodyString}");
          SnackbarContent.errorSnackBar(response.body["message"]);
        }
      });
    } catch (e) {
      debugPrint("Login failed - $e");
      SnackbarContent.errorSnackBar("Login failed. $e");
    }
    isLoginLoading(false);
    update();
  }
 Future<void> xGetrefreshToken({required String token}) async {
   
    isLoginLoading(true);
    try {
      await authRepo.refreshToken(body: {
        "accessToken": token,
       
      }).then((response) async {
        debugPrint(response.bodyString);
        if (response.statusCode == 200 && response.body["success"] == true) {
          final model = UserModelData.fromJson(response.body);
          await Future.wait([
            appStorage.setToken(
                Constant().newToken, model.data?.accessToken ?? ""),
            appStorage.setToken(
                Constant().refreshToken, model.data?.refreshToken ?? ""),
            appStorage.setToken(Constant().refreshToken,
                model.data?.expiresIn.toString() ?? ""),

            authRepo.updateToken(model.data?.accessToken),
          ]);
          clearText();
          SnackbarContent.successSnackBar('Welcome back');
          update();
          Get.offAllNamed(
            RouteHelper.pickupScreen,
          );
        } else {
          isLoginLoading.value = false;
          debugPrint(
              "Login failed - ${response.statusCode} ${response.bodyString}");
          SnackbarContent.errorSnackBar(response.body["message"]);
        }
      });
    } catch (e) {
      debugPrint("Login failed - $e");
      SnackbarContent.errorSnackBar("Login failed. $e");
    }
    isLoginLoading(false);
    update();
  }

  void clearText() {
    usernameController.clear();
    passwordTextController.clear();
    update();
  }
}
