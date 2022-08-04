import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/count_cubit.dart';
import 'package:flutter_application_1/data/gihub_items_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

MultiBlocProvider makeBlocs(Widget child) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<CountCubit>(
        create: (BuildContext context) => CountCubit(),
      ),
      BlocProvider<GithubItemsCubit>(
        create: (BuildContext context) => GithubItemsCubit(),
      ),
    ],
    child: child,
  );
}
