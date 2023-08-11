part of '../TodoList.dart';

typedef void CheckBoxOnPressed(bool checked);
class CheckBox extends StatefulWidget {

    final bool _checked;
    final CheckBoxOnPressed _onPressed;

    CheckBox({bool checked = false, required CheckBoxOnPressed onPressed})
        : _checked = checked, _onPressed = onPressed;

  @override
  State<StatefulWidget> createState() => CheckBoxState();

}

class CheckBoxState extends State<CheckBox> {

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





