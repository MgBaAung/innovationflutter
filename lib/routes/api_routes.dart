class ApiRoutes {
  static const String baseUrl =
      'https://dev.gigagates.com/qq-delivery-backend/';

  // auth
  static const String loginUrl = 'v3/user/';

  //pickup
  static const String pickupUrl = "v4/pickup/list";

  //refresh token
  static const String refreshTokenUrl = "v3/user/refresh_token";
  static const String logoutUrl="/v3/user/revoke_access_token_by_username";
}
