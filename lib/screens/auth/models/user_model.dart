
class UserModelData {
  bool? success;
  UserModel? data;
  String? message;
  String? timestamp;

  UserModelData({this.success, this.data, this.message, this.timestamp});

  UserModelData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ?  UserModel.fromJson(json['data']) : null;
    message = json['message'];
    timestamp = json['timestamp'];
  }

 
}

class UserModel {
  String? accessToken;
  String? tokenType;
  String? refreshToken;
  int? expiresIn;
  String? scope;

  UserModel(
      {this.accessToken,
      this.tokenType,
      this.refreshToken,
      this.expiresIn,
      this.scope});

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
    expiresIn = json['expires_in'];
    scope = json['scope'];
  }

  
}