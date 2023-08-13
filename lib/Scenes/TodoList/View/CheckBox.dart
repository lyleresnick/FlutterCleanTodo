part of '../TodoList.dart';

typedef void _CheckBoxOnPressed(bool checked);
class _CheckBox extends StatefulWidget {

    final bool _checked;
    final _CheckBoxOnPressed _onPressed;

    _CheckBox({bool checked = false, required _CheckBoxOnPressed onPressed})
        : _checked = checked, _onPressed = onPressed;

  @override
  State<StatefulWidget> createState() => _CheckBoxState();

}

class _CheckBoxState extends State<_CheckBox> {

  late bool _checked;

  @override
  void initState() {
    _checked = widget._checked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      final hitSpace = 44.0;
      return SizedBox(
          width: hitSpace,
          height: hitSpace,
          child: new TextButton(
              onPressed: _onClicked,
              child:  Image(
                  width: hitSpace,
                  height: hitSpace,
                  image: AssetImage(
                      _checked
                      ? 'images/checkbox_checked.png'
                      : 'images/checkbox_unchecked.png',
                  ),
              ),
          ),
      );
  }

  void _onClicked() {
      setState(() {
        _checked = !_checked;
      });
      widget._onPressed(_checked);
  }
}





