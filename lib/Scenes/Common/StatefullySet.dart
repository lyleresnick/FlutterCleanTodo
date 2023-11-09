import 'package:flutter/cupertino.dart';

class StatefullySet<T> extends StatefulWidget {
  final Widget Function(BuildContext, T) builder;
  final T? initialValue;

  StatefullySet({required Key key, required this.builder, this.initialValue})
      : super(key: key);

  @override
  State<StatefullySet<T>> createState() => StatefullySetState<T>();

  static void value<T>({required GlobalKey<StatefullySetState<T>> key, required T value}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      key.currentState!.value = value;
    });
  }
}

class StatefullySetState<T> extends State<StatefullySet<T>> {
  T? _value;

  @override
  void initState() {
    _value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _value != null ? widget.builder(context, _value!) : Container();
  }

  set value(T? value) {
    setState(() {
      _value = value;
    });
  }
}
