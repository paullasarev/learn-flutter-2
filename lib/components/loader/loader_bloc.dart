import 'package:bloc/bloc.dart';

typedef LoaderState = bool;

abstract class LoaderEvent {}

class LoaderInvert extends LoaderEvent {}

class LoaderSet extends LoaderEvent {
  final LoaderState value;
  LoaderSet(this.value);
}

class LoaderBloc extends Bloc<LoaderEvent, LoaderState> {
  LoaderBloc() : super(false) {
    on<LoaderInvert>((event, emit) {
      emit(!state);
    });
    on<LoaderSet>((event, emit) {
      emit(event.value);
    });
  }
}
