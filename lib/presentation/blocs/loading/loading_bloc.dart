import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingInitial()) {
    on<LoadingEvent>((event, emit) {
      if (event is StartLoading) {
        return LoadingStartedState();
      } else if (event is FinishLoading) {
        return LoadingFinishState();
      }
    });
  }
}
