import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/beers_cubit.dart';

class GithubPage extends StatelessWidget {
  const GithubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<BeersCubit>(context);
    bloc.load();
    return BlocBuilder<BeersCubit, BeersState>(builder: (context, state) {
      return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green[100]!, width: 2)),
        child: Center(
          child: state.loading
              ? const Text('loading...')
              : ListView.builder(
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
