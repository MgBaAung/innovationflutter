import 'package:get/get.dart';
import 'package:innovation/network/api_client.dart';
import 'package:innovation/routes/api_routes.dart';

class AuthRepo extends GetConnect {
  final ApiClient apiClient;
  AuthRepo({
    required this.apiClient,
  });

  Future<void> updateToken(token) async {
    await apiClient.updateToken(token);
  }

  Future<Response> login({required Map<String, dynamic> map}) async {
    return await apiClient.postData(ApiRoutes.loginUrl, map);
  }

  Future<Response> refreshToken({required Map<String,dynamic> body}) async {
    return await apiClient.postData(ApiRoutes.refreshTokenUrl, body);
  }
}
