import 'dart:async';

import 'bloc.dart';

mixin StarterBloc<Output> implements Bloc {
  final _controller = StreamController<Output>();

  Stream<Output> get stream => _controller.stream;
  void streamAdd(Output value) => _controller.sink.add(value);

  bool get isClosed {
    return _controller.isClosed;
  }

  @override
  void dispose() {
    _controller.close();
  }
}
