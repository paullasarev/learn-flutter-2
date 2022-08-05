import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/api/beers_api.dart';
import 'package:logger/logger.dart';

class BeersState {
  BeersItemList items = [];
  bool loading = false;
  BeersState(this.items, this.loading);
}

typedef BeersItemList = List<Beer>;

BeersState _initial = BeersState([], false);

/// {@template beers_cubit}
/// A [Cubit] which manages an [Beer] as its state.
/// {@endtemplate}
class BeersCubit extends Cubit<BeersState> {
  /// {@macro beers_cubit}
  late BeersClient client;
  late Logger logger;

  BeersCubit() : super(_initial) {
    final dio = Dio();
    client = BeersClient(dio);
    logger = Logger();
  }

  void load() {
    emit(BeersState(state.items, true));
    client.getAles().then((value) {
      logger.i('loaded ${value.length} items');
      emit(BeersState(value, false));
    });
  }
}
