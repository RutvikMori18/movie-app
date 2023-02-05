import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

import '../entities/login_user_params.dart';
import '../repositories/authenticaiton_repository.dart';

class LoginUser extends UseCase<bool, LoginRequestParams> {
  final AuthenticationRepository authenticationRepository;

  LoginUser({required this.authenticationRepository});

  @override
  Future<Either<AppError, bool>> call(params) async {
    return authenticationRepository.loginUser(params.toJson());
  }
}
