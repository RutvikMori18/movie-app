import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movieapp/data/core/un_authorize_exception.dart';
import 'package:movieapp/domain/entities/app_error.dart';

import '../../data/data_resources/authentication_local_data_source.dart';
import '../../data/data_resources/authentication_remote_data_source.dart';
import '../../data/models/RequestTokenModel.dart';

abstract class AuthenticationRepository {
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> params);
  Future<Either<AppError, void>> logoutUser();
}

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;
  final AuthenticationLocaleDataSource authenticationDataSource;

  AuthenticationRepositoryImpl(
      {required this.authenticationDataSource,
      required this.authenticationRemoteDataSource});

  Future<Either<AppError, RequestTokenModel>> _getRequestToken() async {
    try {
      final response = await authenticationRemoteDataSource.getRequestToken();
      return Right(response);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> params) async {
    final requestTokenResponse = await _getRequestToken();
    /*error may be generated*/
    final tokens1 = requestTokenResponse
            .getOrElse(() => RequestTokenModel())
            .requestToken ??
        '';

    try {
      final Map<String, dynamic> body = {};
      body.putIfAbsent('request_token', () => tokens1);
      final validateWithLoginToken =
          await authenticationRemoteDataSource.validateWithLogin(body);
      final sessionId = await authenticationRemoteDataSource
          .createSession(validateWithLoginToken.toJson());
      if (sessionId != null) {
        authenticationDataSource.saveSessionId(sessionId);
        return const Right(true);
      } else {
        return const Left(AppError(AppErrorType.sessiondenied));
      }
      print(sessionId);
      return const Right(true);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on UnAuthorizedException {
      return const Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> logoutUser() async {
    final sessionId = await authenticationDataSource.getSessionId();
    await authenticationRemoteDataSource.deleteSession(sessionId);
    await authenticationDataSource.deleteSessionId();
    // await Future.wait(authenticationRemoteDataSource.deleteSession(sessionId),
    //     authenticationDataSource.deleteSessionId());
    print(authenticationDataSource.getSessionId);
    return const Right(Unit);
  }
}
