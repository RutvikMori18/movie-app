part of 'loading_bloc.dart';

abstract class LoadingState extends Equatable {
  const LoadingState();
}

class LoadingInitial extends LoadingState {
  @override
  List<Object> get props => [];
}

class LoadingStartedState extends LoadingState {
  @override
  List<Object> get props => [];
}

class LoadingFinishState extends LoadingState {
  @override
  List<Object> get props => [];
}
