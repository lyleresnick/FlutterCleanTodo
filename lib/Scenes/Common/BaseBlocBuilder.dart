//  Copyright (c) 2023 Lyle Resnick. All rights reserved.

import 'package:flutter/widgets.dart';

import 'Bloc.dart';
import 'BlocProvider.dart';

class BaseBlocBuilder<SomeBloc extends Bloc<Output>, Output>
    extends StatelessWidget {
  final SomeBloc? bloc;
  final Widget Function(BuildContext, AsyncSnapshot<Output>) builder;
  BaseBlocBuilder({this.bloc, required this.builder});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Output>(stream: bloc?.stream ?? BlocProvider.of<SomeBloc>(context)?.stream, builder: builder);
  }
}
