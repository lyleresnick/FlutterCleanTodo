//  Copyright (c) 2023 Lyle Resnick. All rights reserved.

import 'package:flutter/cupertino.dart';

import 'BlocBuilder.dart';
import 'FullScreenLoadingIndicator.dart';
import 'StarterBloc.dart';

class BlocBuilderData<SomeBloc extends StarterBloc<BlocOutput>, BlocOutput>
    extends StatelessWidget {
  final SomeBloc bloc;
  final Widget Function(BuildContext, BlocOutput) builder;
  BlocBuilderData({required this.bloc, required this.builder});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SomeBloc, BlocOutput>(
        bloc: bloc,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return FullScreenLoadingIndicator();
          }
          final data = snapshot.data!;
          return builder(context, data);
        });
  }
}
