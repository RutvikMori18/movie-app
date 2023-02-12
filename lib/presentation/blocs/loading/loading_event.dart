part of 'loading_bloc.dart';

abstract class LoadingEvent extends Equatable {
  const LoadingEvent();
}

class StartLoading extends LoadingEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FinishLoading extends LoadingEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
