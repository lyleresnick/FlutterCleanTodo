import 'package:flutter/material.dart';


typedef void CheckBoxOnPressed(bool checked);
class CheckBox extends StatefulWidget {

    final checked;
    final CheckBoxOnPressed onPressed;

    CheckBox({this.checked = false, this.onPressed}) ;

  @override
  State<StatefulWidget> createState() => CheckBoxState();

}

class CheckBoxState extends State<CheckBox> {

  bool _checked;

  @override
  void initState() {
    _checked = widget.checked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return SizedBox(
          width: 44,
          height: 44,
          child: new FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: _onClicked,
              child:  Image(
                  width: 44,
                  height: 44,
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
      widget.onPressed(_checked);
  }
}





