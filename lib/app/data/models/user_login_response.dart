class UserLoginResponseModel {
  String token;
  String refreshToken;

  UserLoginResponseModel({required this.token, required this.refreshToken});

  factory UserLoginResponseModel.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseModel(
          token: json['access_token'], refreshToken: json['refresh_token']);
}
