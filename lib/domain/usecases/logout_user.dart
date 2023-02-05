import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

import '../repositories/authenticaiton_repository.dart';

class LogoutUser extends UseCase<void, NoParams> {
  final AuthenticationRepository authenticationRepository;

  LogoutUser({required this.authenticationRepository});

  @override
  Future<Either<AppError, void>> call(NoParams params) async {
    return authenticationRepository.logoutUser();
  }
}
