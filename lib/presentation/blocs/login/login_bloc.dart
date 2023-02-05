import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/common/constants/translation_constants.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/no_params.dart';

import '../../../domain/entities/login_user_params.dart';
import '../../../domain/usecases/login_user.dart';
import '../../../domain/usecases/logout_user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;
  final LogoutUser logoutUser;
  LoginBloc( {required this.logoutUser,required this.loginUser}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginInitiateEvent) {
        final Either<AppError, bool> eitherResponse = await loginUser(
            LoginRequestParams(
                userName: event.username, password: event.password));
        return eitherResponse.fold((l) {
          final String message = getErrorMessage(l.appErrorType);
          return LoginError(message: message);
        }, (r) => LoginSuccess());
      } else if(event is LogOutEvent){
        await logoutUser(NoParams());
        return  ;

      }
    });
  }
  String getErrorMessage(AppErrorType appErrorType) {
    switch (appErrorType) {
      case AppErrorType.database:
      case AppErrorType.api:
        return TranslationConstants.somethingWentWrong;
      case AppErrorType.network:
        return TranslationConstants.noNetwork;
      case AppErrorType.sessiondenied:
        return TranslationConstants.sessionDenied;
      default:
        return TranslationConstants.wrongUsernamePassword;
    }
  }

}

