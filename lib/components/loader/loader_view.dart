import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/components/loader/loader_bloc.dart';

class LoaderView extends StatelessWidget {
  final Widget _widget;
  const LoaderView({
    Key? key,
    required Widget widget,
  })  : _widget = widget,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoaderBloc, LoaderState>(builder: (context, state) {
      return Stack(children: [
        _widget,
        state
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : Container()
      ]);
    });
  }
}
