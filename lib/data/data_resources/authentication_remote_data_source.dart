import '../core/common_api_stracture.dart';
import '../models/RequestTokenModel.dart';

abstract class AuthenticationRemoteDataSource {
  Future<RequestTokenModel> getRequestToken();
  Future<RequestTokenModel> validateWithLogin(Map<String, dynamic> requestBody);
  Future<String?> createSession(Map<String, dynamic> requestBody);
  Future<bool> deleteSession(String sessionId);
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  @override
  Future<String?> createSession(Map<String, dynamic> requestBody) async {
    final response =
        await CommonAPI().postMethod('authentication/session/new', requestBody);
    print(response);
    return response['success'] ? response['session_id'] : null;
  }

  @override
  Future<RequestTokenModel> getRequestToken() async {
    final response = await CommonAPI().getApi('authentication/token/new');
    print(response);
    return RequestTokenModel.fromJson(response);
  }

  @override
  Future<RequestTokenModel> validateWithLogin(
      Map<String, dynamic> requestBody) async {
    final response = await CommonAPI()
        .postMethod('authentication/token/validate_with_token', requestBody);
    print(response);
    return RequestTokenModel.fromJson(response);
  }

  @override
  Future<bool> deleteSession(String sessionId) async {
    final requestBody = {
      'session_id': sessionId,
    };
    final response = await CommonAPI()
        .deleteMethodWithBody('authentication/session', requestBody);
    print(response);
    return response['success'] ?? false;
  }
}
