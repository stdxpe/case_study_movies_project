import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:case_study_movies_project/services/abstract_classes/i_token_storage_service.dart';
import 'package:case_study_movies_project/services/global_services/dependency_injection_service.dart';

class TokenStorageService implements ITokenStorageService {
  final FlutterSecureStorage _storage = locator<FlutterSecureStorage>();

  static const _keyToken = 'jwt_token';

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(key: _keyToken, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: _keyToken);
  }

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: _keyToken);
  }

  @override
  Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
