import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingInitial()) {
    on<LoadingEvent>((event, emit) {
      if (event is StartLoading) {
        return emit(LoadingStartedState());
      } else if (event is FinishLoading) {
        return emit(LoadingFinishState());
      }
    });
  }
}
