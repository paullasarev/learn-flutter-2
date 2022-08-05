import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/count_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountHomePage extends StatelessWidget {
  const CountHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CountCubit>(context);
    return BlocBuilder<CountCubit, int>(builder: (context, state) {
      return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$state',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(5),
                  child: FloatingActionButton(
                    onPressed: bloc.increment,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: FloatingActionButton(
                    onPressed: bloc.decrement,
                    tooltip: 'Increment',
                    child: const Icon(Icons.remove),
                  ),
                ),
              ]));
    });
  }
}
