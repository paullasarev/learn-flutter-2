import 'package:bloc/bloc.dart';

typedef GithubItemList = List<String>;

const _initial = [
  'Hello',
  'World',
];

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class GithubItemsCubit extends Cubit<GithubItemList> {
  /// {@macro counter_cubit}
  GithubItemsCubit() : super(_initial);

  /// Add 1 to the current state.
  void add(String item) => emit([...state, item]);

  /// Subtract 1 from the current state.
  void clear() => emit([]);
}
