import 'package:get/get.dart';
import 'package:innovation/cache/app_storage.dart';
import 'package:innovation/controllers/app_controller.dart';
import 'package:innovation/routes/route_helper.dart';
import 'package:innovation/utils/constants/constants.dart';

class SplashController extends GetxController {
  final appController = Get.find<AppController>();
  final appStorage = AppStorage();
  String token = "";
  @override
  void onInit() {
    initialFunctions();
    super.onInit();
  }

  void initialFunctions() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      decideNextScreen();
    });
  }

  void decideNextScreen() async {
    token = appStorage.getToken(Constant().newToken);
    if (token.isEmpty) {
      Get.offNamed(RouteHelper.login);
    } else {
      Get.offNamed(RouteHelper.pickupScreen);
    }
  }
}
