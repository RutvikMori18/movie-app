import 'package:hive/hive.dart';

abstract class AuthenticationLocaleDataSource {
  Future<void> saveSessionId(String sessionId);
  Future<void> deleteSessionId();
  Future<String> getSessionId();
}

class AuthenticationDataSourceImpl extends AuthenticationLocaleDataSource {
  @override
  Future<void> saveSessionId(String sessionId) async {
    final authenticationStorageBox = await Hive.openBox('authenticationBox');
    return await authenticationStorageBox.put('session_id', sessionId);
  }

  @override
  Future<void> deleteSessionId() async {
    final authBox = await Hive.openBox('authenticationBox');
    authBox.delete('session_id');
  }

  @override
  Future<String> getSessionId() async {
    final authBox = await Hive.openBox('authenticationBox');
    return await authBox.get('session_id');
  }
}
