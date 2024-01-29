import 'package:get/get.dart';
import 'package:innovation/controllers/app_controller.dart';
import 'package:innovation/network/api_client.dart';
import 'package:innovation/routes/api_routes.dart';
import 'package:innovation/screens/auth/network/auth_controller.dart';
import 'package:innovation/screens/auth/network/auth_repository.dart';
import 'package:innovation/screens/pick_up/network/pickup_controller.dart';
import 'package:innovation/screens/pick_up/network/pickup_repo.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() async {
    // //*For APi------------------------------------------------------------>

    ApiClient apiClient =
        Get.put(ApiClient(appBaseUrl: ApiRoutes.baseUrl), permanent: true);
        
    // //*For Repo----------------------------------------------------------->
    AuthRepo authRepo =
        Get.put(AuthRepo(apiClient: apiClient), permanent: true);
    PickupRepo pickupRepo = Get.put(PickupRepo(apiClient), permanent: true);

    //*For Controller-------------------------------------------------------->
    // Get.lazyPut(() => SplashController(), fenix: true);
    Get.put(AppController(), permanent: true);
    Get.lazyPut(() => AuthController(authRepo: authRepo), fenix: true);
    Get.lazyPut(() => PickupController(pickupRepo), fenix: true);
  }
}
