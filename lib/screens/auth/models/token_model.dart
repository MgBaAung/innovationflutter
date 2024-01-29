class TokenModelData {
  bool? success;
  TokenModel? data;
  String? message;
  String? timestamp;

  TokenModelData({this.success, this.data, this.message, this.timestamp});

  TokenModelData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? TokenModel.fromJson(json['data']) : null;
    message = json['message'];
    timestamp = json['timestamp'];
  }
}

class TokenModel {
  String? accessToken;
  String? tokenType;
  String? refreshToken;
  int? expiresIn;
  String? scope;

  TokenModel(
      {this.accessToken,
      this.tokenType,
      this.refreshToken,
      this.expiresIn,
      this.scope});

  TokenModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
    expiresIn = json['expires_in'];
    scope = json['scope'];
  }
}