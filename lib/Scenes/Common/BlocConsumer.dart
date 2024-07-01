//  Copyright (c) 2023 Lyle Resnick. All rights reserved.

import 'package:flutter/cupertino.dart';

import 'BaseBlocBuilder.dart';
import 'BaseBlocConsumer.dart';
import 'Bloc.dart';

class BlocConsumer<SomeBloc extends Bloc<Output>, Output>
    extends StatelessWidget {
  final SomeBloc? bloc;
  final Widget Function(BuildContext, Output) builder;
  final void Function(Output)listener;

  BlocConsumer({required this.bloc, required this.builder, required this.listener});
  @override
  Widget build(BuildContext context) {
    return BaseBlocConsumer<SomeBloc, Output>(
      bloc: bloc,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox();
        }
        final data = snapshot.data!;
        return builder(context, data);
      },
      listener: listener,
    );
  }
}
