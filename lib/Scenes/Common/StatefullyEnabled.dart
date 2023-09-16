import 'package:flutter/cupertino.dart';

class StatefullyEnabled extends StatefulWidget {
  final Widget Function(BuildContext, bool) builder;

  StatefullyEnabled({required Key key, required this.builder})
      : super(key: key);

  @override
  State<StatefullyEnabled> createState() => StatefullyEnabledState();

  static void set({required GlobalKey<StatefullyEnabledState> key, required bool enabled}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      key.currentState!.enabled = enabled;
    });
  }
}

class StatefullyEnabledState extends State<StatefullyEnabled> {
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
