part of 'cast_bloc.dart';

abstract class CastState extends Equatable {
  const CastState();
}

class CastInitial extends CastState {
  @override
  List<Object> get props => [];
}

class CastErrorState extends CastState {
  @override
  List<Object> get props => [];
}

class CastLoaded extends CastState {
  final List<CastEntity> casts;

  const CastLoaded({required this.casts});
  @override
  List<Object> get props => [casts];
}
