//  Copyright (c) 2021 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'Bloc.dart';

mixin StarterBloc<Output> implements Bloc<Output> {
  final _controller = StreamController<Output>();

  @override
  Stream<Output> get stream => _controller.stream;

  @override
  void emit(Output value) => _controller.sink.add(value);

  @override
  void dispose() {
    _controller.close();
  }
}
