import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/loader/loader_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/beers_cubit.dart';

class BeersPage extends StatelessWidget {
  const BeersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<BeersCubit>(context);
    var loader = BlocProvider.of<LoaderBloc>(context);

    bloc.load();
    return BlocBuilder<BeersCubit, BeersState>(builder: (context, state) {
      loader.add(LoaderSet(state.loading));
      return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green[100]!, width: 2)),
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              return Align(child: Text(state.items[index].name!));
            },
          ),
        ),
      );
    });
  }
}
