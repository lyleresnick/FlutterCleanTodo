//  Copyright (c) 2023 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter/widgets.dart';

import 'Bloc.dart';
import 'BlocProvider.dart';

class BaseBlocConsumer<SomeBloc extends Bloc<Output>, Output>
    extends StatefulWidget {
  final SomeBloc? bloc;
  final Widget Function(BuildContext, AsyncSnapshot<Output>) builder;
  final void Function(Output)listener;

  BaseBlocConsumer({this.bloc, required this.builder, required this.listener});

  @override
  State<BaseBlocConsumer<SomeBloc, Output>> createState() => _BaseBlocConsumerState<SomeBloc, Output>();
}

class _BaseBlocConsumerState<SomeBloc extends Bloc<Output>, Output> extends State<BaseBlocConsumer<SomeBloc, Output>> {
  var downStreamController = StreamController<Output>();
  late final Stream<Output>? originStream;

  @override
  void initState() {
    originStream = (widget.bloc?.stream ?? BlocProvider.of<SomeBloc>(context)?.stream);
    originStream?.listen(_originListener);
  }

  void _originListener(Output event) {
    downStreamController.sink.add(event);
    widget.listener(event);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Output>(stream: downStreamController.stream, builder: widget.builder);
  }

  @override
  void dispose() {
    downStreamController.close();
    super.dispose();
  }
}
