//  Copyright (c) 2023 Lyle Resnick. All rights reserved.

import 'package:flutter/cupertino.dart';

import 'BaseBlocBuilder.dart';
import 'Bloc.dart';

class BlocBuilder<SomeBloc extends Bloc<Output>, Output>
    extends StatelessWidget {
  final SomeBloc? bloc;
  final Widget Function(BuildContext, Output) builder;
  BlocBuilder({required this.bloc, required this.builder});
  @override
  Widget build(BuildContext context) {
    return BaseBlocBuilder<SomeBloc, Output>(
        bloc: bloc,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SizedBox();
          }
          final data = snapshot.data!;
          return builder(context, data);
        });
  }
}
