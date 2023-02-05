part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoginInitiateEvent extends LoginEvent {
  final String username, password;

  const LoginInitiateEvent({required this.username, required this.password});
  @override
  // TODO: implement props
  List<Object> get props => [username, password];
}

class LogOutEvent extends LoginEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
