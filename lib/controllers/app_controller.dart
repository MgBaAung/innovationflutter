import 'package:get/get.dart';
import 'package:innovation/cache/app_storage.dart';
import 'package:innovation/network/api_client.dart';
import 'package:innovation/utils/constants/constants.dart';

class AppController extends GetxController implements GetxService {
  final apiClient = Get.find<ApiClient>();
  final appStorage = AppStorage();

  String token = "";

  bool get isAuthenticated => token.isNotEmpty;

  loadCurrentUser() async {
   token = appStorage.getToken(Constant().newToken);
    apiClient.updateToken(token);
    update();
  }
}
