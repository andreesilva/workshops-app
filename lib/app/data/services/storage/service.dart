import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:workshops_app/app/core/util/get_storage_key.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class StorageService extends GetxService {
  final getStorage = GetStorage();

  final _accessToken = RxnString();

  //String? get accessToken => _getStorage.read(GetStorageKey.access_token);
  String? get accessToken => _accessToken.value;

  @override
  void onInit() {
    //_accessToken.value = _getStorage.read(GetStorageKey.access_token);
    _accessToken.value = getStorage.read(GetStorageKey.access_token.toString());
    getStorage.listenKey(GetStorageKey.access_token.toString(),
        (value) => _accessToken.value = value);

    super.onInit();
  }

  Future<void> saveToken(String token) {
    print("SaveToken");
    print(token);
    return getStorage.write(GetStorageKey.access_token.toString(), token);
  }

  Future<void> removeToken() {
    return getStorage.remove(GetStorageKey.access_token);
  }

  bool isTokenExpired(String token) {
    return JwtDecoder.isExpired(token);
  }
}
