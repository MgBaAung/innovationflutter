import 'package:get/get.dart';
import 'package:innovation/network/api_client.dart';
import 'package:innovation/routes/api_routes.dart';

class PickupRepo extends GetConnect {
  final ApiClient apiClient;

  PickupRepo(this.apiClient);
  Future<Response> getPickupList({required Map<String,dynamic> body}) async {
    return await apiClient.postData(ApiRoutes.pickupUrl,body);
  }

  Future<Response> lgout({required Map<String,dynamic> body}) async {
    return await apiClient.postData(ApiRoutes.logoutUrl,body);
  }
}
