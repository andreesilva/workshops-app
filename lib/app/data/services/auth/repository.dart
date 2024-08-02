import 'package:workshops_app/app/data/models/user.dart';
import 'package:workshops_app/app/data/models/user_login_request.dart';
import 'package:workshops_app/app/data/models/user_login_response.dart';
import 'package:workshops_app/app/data/providers/api.dart';

class AuthRepository {
  final Api _api;

  AuthRepository(this._api);

  Future<UserLoginResponseModel> login(
          UserLoginRequestModel userLoginRequestModel) =>
      _api.login(userLoginRequestModel);
  Future<UserModel> getUser() => _api.getUser();
}
