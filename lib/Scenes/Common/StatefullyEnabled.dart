import 'package:flutter/cupertino.dart';

class StateFullyEnabled extends StatefulWidget {
  final Widget Function(BuildContext, bool) builder;

  StateFullyEnabled({required Key key, required this.builder})
      : super(key: key);

  @override
  State<StateFullyEnabled> createState() => StateFullyEnabledState();

  static void show({required GlobalKey<StateFullyEnabledState> key, required bool enabled}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      key.currentState!.enabled = enabled;
    });
  }
}

class StateFullyEnabledState extends State<StateFullyEnabled> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _enabled);
  }

  set enabled(isEnabled) {
    setState(() {
      _enabled = isEnabled;
    });
  }
}
